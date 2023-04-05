Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F16D721F
	for <lists+freedreno@lfdr.de>; Wed,  5 Apr 2023 03:43:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D9A10E2F8;
	Wed,  5 Apr 2023 01:43:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D754010E818
 for <freedreno@lists.freedesktop.org>; Wed,  5 Apr 2023 01:43:39 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id n1so17342162ili.10
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 18:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680659017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwpFUC847/YFt/XfpeQoDJ4SxIEry2tnTeuETvaZGB8=;
 b=AKuoKHGlH1lD7pwZVaelQ4c9jugNejWoMFXKvR8l4uh089YTkI+noLq2giimPxOSCG
 v0cEvd5rSbMcQXXE7ZipTL6CP6rxBmiHQmLrLsFOWknhiXdbXbX6FTcovaFAOJdOBpVe
 IWYCx5ALWHmaVZ+r5ZJAbc1NCwzMbVvxnF79Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680659017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwpFUC847/YFt/XfpeQoDJ4SxIEry2tnTeuETvaZGB8=;
 b=i9mHAPrvRTlr8jryM/taD4OS3OZu7SOUcNeFwFgZIn18vkBDzrJtfReIF62xi8KYxy
 okN4UyYFUwsL1cxtQWkjZkv9EpjbgQe/ux9MJhQCSrQpe7aVJL7nLJKOXDI23p25WZm8
 PYU050TESqqvmpT0KDDdbG/VuLEdlrVYsx/VBMF0+XxHHX+S0R4vP4JFK476WYgmV+hg
 ywj7KO/7FkAXWUYV4Jq56BU4TMlwYtdl0zMqFUWtb94xiRQf4/iQemwy345qkYYx3O29
 WzPLe08pBgQCLJqBQParOzUQfnp5WUHvdDVc1w5eZiLHeTLnALW/ZKD0js5inWRuQoX4
 XkbA==
X-Gm-Message-State: AAQBX9cBxVxuWmMavEa6oeIKNi2ta+OhuwEeS5BVpyUuF+1DDGGhh3Z4
 JWmNd8ffj2tdRQlATlTaEj0Z7g7Ii8dXksr/iCA=
X-Google-Smtp-Source: AKy350b4Pwtnft6850G16Glk1lowtic2ZwoAH9/y0RH8bTOIC+9VWN6V7VP/NnwNv/b7tqrt+bhuUw==
X-Received: by 2002:a92:cecd:0:b0:316:e6e4:570b with SMTP id
 z13-20020a92cecd000000b00316e6e4570bmr3315990ilq.11.1680659017219; 
 Tue, 04 Apr 2023 18:43:37 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178]) by smtp.gmail.com with ESMTPSA id
 y14-20020a056e02118e00b003232362a4c2sm3601183ili.8.2023.04.04.18.43.33
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 18:43:34 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id h14so16706742ilj.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Apr 2023 18:43:33 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d9a:b0:325:dd36:7451 with SMTP id
 h26-20020a056e021d9a00b00325dd367451mr2720800ila.1.1680659013319; Tue, 04 Apr
 2023 18:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 4 Apr 2023 18:43:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XV4yjUb2ufQZjOTYsgFXE0Ghnor3f8FCSdpV_pcZd1yg@mail.gmail.com>
Message-ID: <CAD=FV=XV4yjUb2ufQZjOTYsgFXE0Ghnor3f8FCSdpV_pcZd1yg@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v1 1/3] drm/msm/dpu: set dirty_fb flag while
 in self refresh mode
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 31, 2023 at 6:59=E2=80=AFAM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> While in virtual terminal mode with PSR enabled, there will be
> no atomic commits triggered without dirty_fb being set. This
> will create a notion of no screen update. Allow atomic commit
> when dirty_fb ioctl is issued, so that it can trigger a PSR exit
> and shows update on the screen.
>
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)

I can confirm that this patch plus patch #2 fixes the typing problems
seen on VT2 on a Chromebook using PSR.

Tested-by: Douglas Anderson <dianders@chromium.org>


-Doug
