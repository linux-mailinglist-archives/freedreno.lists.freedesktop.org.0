Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 834A04FCD8F
	for <lists+freedreno@lfdr.de>; Tue, 12 Apr 2022 06:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C6910FE16;
	Tue, 12 Apr 2022 04:22:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4F510FE16
 for <freedreno@lists.freedesktop.org>; Tue, 12 Apr 2022 04:22:02 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id b188so17841384oia.13
 for <freedreno@lists.freedesktop.org>; Mon, 11 Apr 2022 21:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=tjT6fKt+FqeEOcNg0osLvB2083tulirjm/yjb0EMPNw=;
 b=if+yP4Pk/q28d73RXmoK3hDDqXFu1H3qtu1L+w4XrCR45OD2hD75330dqbWLYDyMTy
 zuohjk0ezFvJVPyEO49t8DYP7+w021vx7wAl1bCj8P803lDE+8h5KCq+gAu4rSy2E+mp
 vdozwB+OGr/AC5hX7IBcHGLWZjwaGa8A8KSEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=tjT6fKt+FqeEOcNg0osLvB2083tulirjm/yjb0EMPNw=;
 b=qpm1a2ZjPCLLseTZNgb6tKRak163APbs4jESiP1HLUb7gona3DVHWxSYNgfBHNDvGG
 LWhY2KWp8+v1onSGQu1/D2Cq1/AhEOvgGn4PtEOWxCy3Mw6vkpxZg4Nu4PxnKdapcNCg
 PvPjF1tmn4lBaatFiW8W7I53MabzuhSMF56pm2aMPaqUqTqaGhSBWpHP4DOCX4JKRO50
 SRONtt9fXSoTlw96m2bVSnbvag0mb05LRT48UPxlSduryu7u7zmob2AqhMfWnTsJbz8N
 KgtbsUZULmZC9o0Q2L07x/ItPzqAHFc+MGqUE4G11r3849OoxI76OJtQoDGBjW2nOfy6
 xo7w==
X-Gm-Message-State: AOAM533UihsJq01epkmNIkzCRWUGkpByMugJcLKbzhrkTAxGwfQa2sgz
 Auyb4OZpkU7ccV4ZDCPY03NmTPj8TpCW1pMYNLDfjg==
X-Google-Smtp-Source: ABdhPJx23C8bH5PTdYl8UcvVuno+rfEBOgQ0RygYLdcavLD1pmbKLxkf8ZLS/jFBVhj+Xqp91D6yZh3UFs9TdUx3Hgc=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr975536oif.63.1649737321426; Mon, 11 Apr
 2022 21:22:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Apr 2022 00:22:00 -0400
MIME-Version: 1.0
In-Reply-To: <dcdae9ca-1896-e632-17f3-ffd4de7c9c1b@quicinc.com>
References: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53zYpqJL9GCoqZRwMptCne+4Dk4thz-7rCDac7H98dm=A@mail.gmail.com>
 <7529d921-0b12-d162-416d-3542933a0aed@linaro.org>
 <dcdae9ca-1896-e632-17f3-ffd4de7c9c1b@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 12 Apr 2022 00:22:00 -0400
Message-ID: <CAE-0n52QWn6hZp2ty5kjJ-rrQ+VvhQuR7exTW=0k4Yu8=RobAg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, 
 airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: stop event kernel thread when
 DP unbind
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-04-11 17:29:17)
>
>
> On 4/11/2022 5:22 PM, Dmitry Baryshkov wrote:
> > On 12/04/2022 03:21, Stephen Boyd wrote:
> >> Quoting Kuogee Hsieh (2022-04-11 17:08:49)
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kthread_run(hpd_event_thread, d=
p_priv, "dp_hpd_handler");
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dp_priv->ev_tsk =3D kthread_run=
(hpd_event_thread, dp_priv,
> >>> "dp_hpd_handler");
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(dp_priv->ev_tsk))
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 DRM_ERROR("failed to create DP event thread\n");
> >>
> >> Why can't we error out? Why can't this kthread be started in probe?
> >
> > Just my 2c. I don't think starting it in probe is a good idea. The
> > driver uses components, so, in my opinion, the thread should be started
> > from bind and stopped in unbind.
>
> Yes, I also agree it should be started in bind and stopped in unbind.
>

Sounds good to me! I forgot that this is a component.
