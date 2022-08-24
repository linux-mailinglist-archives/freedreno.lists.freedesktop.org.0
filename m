Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220735A037A
	for <lists+freedreno@lfdr.de>; Wed, 24 Aug 2022 23:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736BA10E469;
	Wed, 24 Aug 2022 21:54:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF0510E469
 for <freedreno@lists.freedesktop.org>; Wed, 24 Aug 2022 21:53:55 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id gt3so23617973ejb.12
 for <freedreno@lists.freedesktop.org>; Wed, 24 Aug 2022 14:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=e0BBD5TlKOKblZMGz0uca2eTu4Q7+zmoU/TJNY6Fw4M=;
 b=kbg01HmT3sDmroGWqlHtDMn6Q1s0LnzIIPuPdtBFLvMNwsL0ULIs7afs/n/byMDq/J
 Fgd3oMzq7tnWcK71oLPxAFSc/DBJYZfeyQzjaztKzH9qCEqwfF7BPtnc17KjdxK1Arie
 rSaziN52MxfLVXBKGlzcX3z3PP1cuaYr7+3bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=e0BBD5TlKOKblZMGz0uca2eTu4Q7+zmoU/TJNY6Fw4M=;
 b=z1NiVcnQtLWgd/CxlvXqt8V4enmBmQDNP8uMt9VIwRlgRImjiqx/4Jb1NeoqqM6iRt
 A2CxpmmvdQLk8Q32majNdMlvo2ACWLuHIiY97M1oLR8ACpRXFJ+hBra2lrc+GKIfjbcq
 6ybpefNst1zVfU8WYeAbx0G19IqLiBINIweCGpGGF9p4ubVw5SMDkmzZBujXukhNIBa9
 +0+YHUuVelDVOBSBer9mWBtkFQfDzzrQFQOYBqffSGeSsH0DizDvdJZ+x9htN92leS2t
 taiPQjktjo/KXIPVsROt3SCVgi/CgvmvxAb3KBEOWIne/85ww64UUA3/0xXm9Rxt+6rV
 c18A==
X-Gm-Message-State: ACgBeo0ZDv4hVZLEGxeBpDT9I0Rl3eMg885Nls6dwwcnUAGQrkEPeMMn
 aBT2E1QLpuSLnzKlzsaCIXIg4iiSslzei+sh
X-Google-Smtp-Source: AA6agR6AIzLaD+oH34l7i1U8LJWwvWhkGGKcP/+2eeVq2i2xw9kzE1DqasfgFsYeUVBQlX8uLlYzqg==
X-Received: by 2002:a17:906:5d07:b0:739:8df9:3c1e with SMTP id
 g7-20020a1709065d0700b007398df93c1emr560579ejt.345.1661378034023; 
 Wed, 24 Aug 2022 14:53:54 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 p2-20020aa7d302000000b00445e037345csm711902edq.14.2022.08.24.14.53.53
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 14:53:53 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id e20so21845860wri.13
 for <freedreno@lists.freedesktop.org>; Wed, 24 Aug 2022 14:53:53 -0700 (PDT)
X-Received: by 2002:a05:6000:507:b0:225:5019:803b with SMTP id
 a7-20020a056000050700b002255019803bmr564865wrf.617.1661378032767; Wed, 24 Aug
 2022 14:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <1661372150-3764-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1661372150-3764-1-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Aug 2022 14:53:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WWP1hgvpGN=62d585GOsT7+399N9DSbne_7XNwza00Uw@mail.gmail.com>
Message-ID: <CAD=FV=WWP1hgvpGN=62d585GOsT7+399N9DSbne_7XNwza00Uw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dp: correct 1.62G link rate at
 dp_catalog_ctrl_config_msa()
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 24, 2022 at 1:16 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> At current implementation there is an extra 0 at 1.62G link rate which cause
> no correct pixel_div selected for 1.62G link rate to calculate mvid and nvid.
> This patch delete the extra 0 to have mvid and nvid be calculated correctly.
>
> Changes in v2:
> -- fix Fixes tag's text
>
> Changes in v3:
> -- fix misspelling of "Reviewed-by"
>
> Fixes: 937f941ca06f  ("drm/msm/dp: Use qmp phy for DP PLL and PHY")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
