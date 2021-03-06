import React, { FunctionComponent } from 'react'
import Link from 'next/link'
import { Shield, Icon, Heart, GitHub, Twitter } from 'react-feather'
import styled from '@emotion/styled'
import { maxWidth, Colors, smallScreen } from '@/styles/vars'

const Wrapper = styled.p({
  maxWidth: maxWidth,
  margin: '0 auto',
  paddingBottom: 30,
  display: 'flex',
  flexFlow: 'row wrap',
  justifyContent: 'space-between',
  fontSize: '0.9em',
  span: {
    display: 'inline-flex',
    alignItems: 'center'
  },
  [smallScreen]: {
    backgroundColor: Colors.Primary,
    span: {
      flex: '1 0 100%',
      justifyContent: 'center',
      marginBottom: 20,
      color: 'white'
    }
  }
})


const IconLinkAnchor = styled.a({
  display: 'inline-flex',
  alignItems: 'center',
  textDecoration: 'none',
  margin: '0 8px'
})

const IconLink: FunctionComponent<{ icon: Icon, href: string }> = ({ icon: Icon, href, children }) => (
  <Link href={href} passHref>
    <IconLinkAnchor>
      { children }
      <Icon size={16} style={{ marginLeft: 6 }}/>
    </IconLinkAnchor>
  </Link>
)

export const SmallPrint = () => (
  <Wrapper>
    <span>Built by <IconLink icon={Heart} href="https://samgarson.com">Sam Garson</IconLink></span>
    <span>
      <IconLink icon={GitHub} href="https://github.com/samtgarson/MusicPractice">Code</IconLink>
      <IconLink icon={Twitter} href="https://twitter.com/samtgarson">Twitter</IconLink>
      <IconLink icon={Shield} href="/privacy-policy">Privacy Policy</IconLink>
    </span>
  </Wrapper>
)
