Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D461A4B7CF0
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 02:56:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E02A10E5EA;
	Wed, 16 Feb 2022 01:56:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB4F10E5E9
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 01:56:36 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id q8so974792oiw.7
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 17:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KCyjpWkYyVwulnMSGHPzK15YA1gsgRLkW8T95C42RLs=;
 b=LNR7cMd/oTxmlVmnnr0/9oha/NJrcVP8Di5AvttdpQ+MIGv8ctlPHPVN341VV7bgAS
 nM03GM3lYzgcsmEsTln+dO0IyYD4Uo847Rf9OvcngvEaHIjJhdt+NbIyeSX/hOASHY+r
 zrodAlxjW66C1q0PGih0d7Ga52QMSfq2lcf+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KCyjpWkYyVwulnMSGHPzK15YA1gsgRLkW8T95C42RLs=;
 b=HnNMwAq6brgv0orQBDlpWTxf5bwG6/mAXWd1gTC9EKcRNjhEKKNIR/xzSYvVSp9DEs
 8/+4nlXCuUWsCjjneIy3q9ZO+8xPhjeCQo6KFwd4n/IOwWBCw1ofxaWtjDGsXXDxYU4w
 YYq5JBZkEOHvt99zAMzGWaKXHb/95fpBu1PxaByUqLfvmRlDeNztL84zLx29HdcaSWBB
 v63lsqMURNh0GkG7rV3+U/kkaQ18cRW8TQL0v+kLHAuJUa6Pgg44wLLotylrdU5JS1MV
 3CEfAXQx4+uaWrL3cs0DoC0RFqD4HlzSuuja7GwRv1lF2LkQR29g3zlTmbxT/ZecoVF/
 yuCA==
X-Gm-Message-State: AOAM530BdpISlHMN5vtGpUkkMXWTJ1i2fGEFROCi23N1eHxq4zJezsZ7
 iVsrTET39xCQvce+Sip/lg5/eGZ7uIMZf/T6PCKwUQ==
X-Google-Smtp-Source: ABdhPJxYf/Ggt3IXaM5zUgr3PhbxATDPeznV3McX+HESVwjV1FmJjaH2gqnopr4zi66eMYtzYAWT/VgNG3JzRBLp2YQ=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2949049oig.40.1644976596157; Tue, 15
 Feb 2022 17:56:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:56:35 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-3-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:56:35 -0800
Message-ID: <CAE-0n51haHQTtZy08Quo66WnuDin_kx8MK_sytNQ1x_N9YU-Wg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/8] drm/msm: move struct
 msm_display_info to dpu driver
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:37)
> The msm_display_info structure is not used by the rest of msm driver, so
> move it into the dpu1 (dpu_encoder.h to be precise).
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
