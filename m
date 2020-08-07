Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E123F2D1
	for <lists+freedreno@lfdr.de>; Fri,  7 Aug 2020 20:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A5C6E1A4;
	Fri,  7 Aug 2020 18:35:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41C96E1A4;
 Fri,  7 Aug 2020 18:35:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r2so2531658wrs.8;
 Fri, 07 Aug 2020 11:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/7v8tLZPCG6zEGppTbnr/mOQh18VtmETDIdiYaSnWP4=;
 b=GMJYlwU4paaFWGfBg5xc4htfZR0j3RuMsCImhjl4L0pS49fbajy9/llOEcQPxIxo18
 n8/esKaUsGlne0LZD6w7qqCfWlu03X/IHF1k96AixDQWmOr/jQbLD5UrJynNahS2DIX9
 tlj4B3h3SWY1DYgts730/6n14UBICFltHEZtiDrQjxH2A2e7kknkTnifSy7J/v3mnQx3
 nI8DtzTkgg1unTBk4BxO03qkbh5jwkaFinosFuMU5OTPjl0js8pCDowp/qlzUKcz+G0q
 +0VvuE6uhB1fIxEd99TfFEoXkarY3kYDE+DX8gZZdi/tmugVHd/V2dwX3rViqBMyHLM/
 /sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/7v8tLZPCG6zEGppTbnr/mOQh18VtmETDIdiYaSnWP4=;
 b=SUQ6QQTeDLvZ/b30E/7HMlMpuE3bOrPTGHejARPcs5KDZgsAb+MDxXGUw11fx9zK6C
 XA2YThbkButCV5rE+7L1bumjiop0XS3ttPutRCS7mE9Bu9Wu8qKHyFQf/P4VhxH6EKdg
 l5hmalr5zmrjtYAK/O1gZk2jGtzyymSgV+fC3Y4bhvUivfenb/BLWHU9ayvbedEiuosG
 tWADkAMZV9wRg5+3gZa/zerPIRPN0IhQLQ9/rwd8T2MGRhI05d7yEZUe31IOYV+n6TfF
 dGDKOi98Ne3QYgNV4vvOhtEKQCAt/BrCi+avkx8tVYM4021gYtBX6GCqX61zkQKwVvrf
 tC5w==
X-Gm-Message-State: AOAM532KsdUTCfNkouYS6SYww7XphSBzosdwSZAZqJP5/QxmpOpYo2eC
 SHMb7oDm9V6QkQis0v1JZJciAXn8YUNZatQTzRY=
X-Google-Smtp-Source: ABdhPJxiSl+Xf4ZOjRL9fxYlXlSSB7aIXCHCh2kclUFefC9ORTjb2cvzLFJYlbiCHFrVGJM4zmJKVF4OaMQY4g0/yVM=
X-Received: by 2002:adf:ec04:: with SMTP id x4mr12529322wrn.28.1596825310354; 
 Fri, 07 Aug 2020 11:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596523009.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <cover.1596523009.git.saiprakash.ranjan@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Aug 2020 11:35:54 -0700
Message-ID: <CAF6AEGv3drZA64mRLxqwJ5nW597=GRV80GM6k7vLO306nytDkg@mail.gmail.com>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 0/2] Remove unused downstream bus scaling
 apis
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Aug 3, 2020 at 11:45 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> MSM bus scaling has moved on to use interconnect framework
> and downstream bus scaling apis are not present anymore.
> Remove them as they are nop anyways in the current code,
> no functional change.
>

thanks, nice cleanup.. I'm pulling into msm-next-staging

BR,
-R

> Sai Prakash Ranjan (2):
>   drm/msm/mdp4: Remove unused downstream bus scaling apis
>   drm/msm/mdp5: Remove unused downstream bus scaling apis
>
>  .../gpu/drm/msm/disp/mdp4/mdp4_dtv_encoder.c  | 51 --------------
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      | 13 ----
>  .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c | 47 -------------
>  .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 24 -------
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 68 -------------------
>  5 files changed, 203 deletions(-)
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
