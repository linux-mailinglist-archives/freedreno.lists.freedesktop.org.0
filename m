Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7437E4A8E
	for <lists+freedreno@lfdr.de>; Tue,  7 Nov 2023 22:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0460A10E6B6;
	Tue,  7 Nov 2023 21:24:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE6C10E6B6
 for <freedreno@lists.freedesktop.org>; Tue,  7 Nov 2023 21:23:56 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-d9ca471cf3aso6501232276.2
 for <freedreno@lists.freedesktop.org>; Tue, 07 Nov 2023 13:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699392235; x=1699997035; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dvTG10ABG0x3sP4grZoASxI3B60KESzfNKXhZ50ortI=;
 b=BpoIjSXvdmqULP47SprpoOIChCkF4YjuOeZknZXu3Xp+6Oo0pEeKq2s2btjs3mB2hG
 ZRHQAGedTMtSUqD6NeRhxDbHVRjDJMtUmIV8aA4oRTbbYze78sY9Y8ZwntGbWI1Bxs6N
 f052RTJeoAS350OE7i9ScwnAQknwJfsjusgnSkQqEtnqWrIrA6c0sr35doqwIASFzhqE
 Bjx2AK4t3TcuZrQrvfkhYPR51GzKjcBGCD9V4uOF9T1eYlNXcy8Y2lwNx88LjqqPmLnD
 w7AOXp7fZgQrxSG00jAb/ey3m78xhYQphQkeOxJgsXCIqqLqgLDlxtkb+6RuUiHJ7Bje
 rShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699392235; x=1699997035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dvTG10ABG0x3sP4grZoASxI3B60KESzfNKXhZ50ortI=;
 b=rfIbSWqGWVGM6VvZKDYP+MRp4T+H4omE7Y0tc6MqgnjCJ6xHfV5DY0St+lBjATU9oB
 /kUZich1CRTN6lTLIx+ObkqChX2gwpTPp4QN3BwBcRsZdIVTLVIwiA0YipltQFS70sPu
 8RHwKBSgqh11OYyg1tZ0Db1SHBtf1PPdL0AOssgtYVQ/L48viJPJMuGsVDssUbfVoSFd
 Gr4nO23KL2uCAWF/hRZ7LPQSub4m0VWS0xYjJlXZN9MMm2xNFXa6ujMI3uDh/2IRIk4+
 YTHLcGSHcC/SosbEF+Vlj0tdfbWGC5mWHrIHNbfx6iu14bvyZScLb5bTmHbftAzJmrsA
 aC7A==
X-Gm-Message-State: AOJu0Yx6FYwX9yE6EGx+FywmONzKx4E4W6GTubo+Eh/OqYR0dmZnr8/+
 BeWHX+CYPQO8Ac1FDWVIUocbEI0UwCja65kh3fLGLQ==
X-Google-Smtp-Source: AGHT+IGTIU8jvCkV2BUmMTj6P61DCp2zrVll07uOzohXhnifKAxxWHa52coxZVe3Ciqk7nE0PKdFhk/25bhDX0311ks=
X-Received: by 2002:a25:202:0:b0:da3:b4a0:8807 with SMTP id
 2-20020a250202000000b00da3b4a08807mr19738231ybc.65.1699392235379; Tue, 07 Nov
 2023 13:23:55 -0800 (PST)
MIME-Version: 1.0
References: <1696632910-21942-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpoFRp+7GyO=F3Ar21tfG5Yt0cL6zkAquqg7D1XXQjp50Q@mail.gmail.com>
 <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com>
In-Reply-To: <55a4f98e-2772-e4fd-ae8a-132f92582c78@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 23:23:43 +0200
Message-ID: <CAA8EJpo9CFf-Z3eiuKPvwf-y6eGkSibro-q-=SBxKK_L-zFOBA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 0/7] incorporate pm runtime framework and
 eDP clean up
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 7 Nov 2023 at 23:01, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 11/6/2023 5:55 PM, Dmitry Baryshkov wrote:
> > On Sat, 7 Oct 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> The purpose of this patch series is to incorporate pm runtime framework
> >> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
> >> driver during system probe time. During incorporating procedure, original
> >> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
> >> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
> >> provided by pm runtiem framework such as pm_runtime_force_suspend() and
> >> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
> >> are bound at system probe time too.
> >
> > With this patchset in place I can crash the board using the following
> > sequence (SM8350-HDK):
> >
> > - plug the USBC DP dongle
> > - run modetest at any mode, don't press Enter yet
> > - unplug the dongle
> > - press Enter to stop modetest
> >
> > => the board resets to Sahara.
> >
> > Please ping me if you need any additional information from my side.
>
> questiosn,
>
> 1) which dongle are you used?

I have used several Dell and Hama USB-C dongles.

>
> 2) what code branch shoud I used to duplicate this problem.

I have pushed my kernel tree to
git.codelinaro.org/dmitry.baryshkov/linux.git, branch test-dp-rpm
I had several UCSI patches on top, but they should not be relevant.

>
> I can not duplicate  system crash problem at my setup kodiak (SM7325)
> chrome book with my PM runtime patch series.
>
> my code base is Linux 6.6-rc2 + pm runtime patch series (7 patches)
>
> I did:
>
> 1) plugin either apple dongle (DP-to-HDMI) + 1080p display or DP typeC
> cable directly to 1080p display
>
> 2)  stop ui
>
> 3) /usr/bin/modetest -M msm -s 34:1920x1080 (see test pattern show at
> display)
>
> 4) unplug apple dongle or DP typeC cable
>
> 5) hit enter key
>
> 6) start ui
>
> 7) display back to login page of chrome book
>
>


-- 
With best wishes
Dmitry
