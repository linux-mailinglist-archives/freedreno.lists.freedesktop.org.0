Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC66A6F2278
	for <lists+freedreno@lfdr.de>; Sat, 29 Apr 2023 04:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9280010E061;
	Sat, 29 Apr 2023 02:46:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C2210E1AE
 for <freedreno@lists.freedesktop.org>; Sat, 29 Apr 2023 02:46:56 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-54fb6ac1e44so8088367b3.1
 for <freedreno@lists.freedesktop.org>; Fri, 28 Apr 2023 19:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682736415; x=1685328415;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7AvvVOSHUebik0pK4etJRGnSRHrTFQ2KZK3q3Gebd0I=;
 b=oRptrL/V3bqyA6xemD7/7y08vO70rrFqiY7PWFElSjPjxYpT+FLfD3gxcbQiXTJFUj
 ZOrwu5bkUeF3bLt+4MpLm+SclHRghJT/1tTK6ERtnW1dzNVboJmGTG202he4/ScubhQI
 OlNZ9fsDjlAFMWG2CO9jp+CGQB7gc76EzFCbp4f+OU9kbbZtiJyA3vZ/X0f1cBeqFfYO
 kM0+Kc7b1L/ijSyoUSMGRY7fgvVP0wB8A+h0hQvE+hw/NrELaVnpwk7AwsyCXmUtMONW
 33hnZAoljh48s9FwI9h08694PlGB+VmCpfWUvkkQgaU1kwWL/QcS4X0nTMr2Dd87f5ej
 +zFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682736415; x=1685328415;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7AvvVOSHUebik0pK4etJRGnSRHrTFQ2KZK3q3Gebd0I=;
 b=OT3IxI6Go2IcAdL0IA5UfM9ldsJG980DZ2Klr4AtNs1NTBWYQlkJ6hP5ihdlT1FC/u
 D830gekfMjTKH287qStRkeXspcyw4hm9jfOzVSOQehqZYJYKUEY6s8YuCy2szAgiXTs/
 lUugXy1x7RBpLxfzZ2hAjMIzwhC6c1EMcQA+IjLTbI10PVZ0MNOKN4aQK3tgIbhEsQni
 aWZr7M2RzrllczmaTlAOeO3nSluYRV+DddGgArfk+IDyvpjFLs1T3CMcAH+R1AtcGCvR
 /ULs4OnUholtUhMK5hAc3o8QlH8OF53w8BRUjtPxk1UUNgvr4CD5ZlKJT0HpSgWW31t4
 EVag==
X-Gm-Message-State: AC+VfDxEHKqxCKMtXu7TRsaqDS6TbrsIW0KVbQ2fOYUZXufe3SPwdmma
 mmI4EuV0QqYw+2D7BEoNXxxwg9SVdWR6KC2UIxTyUA==
X-Google-Smtp-Source: ACHHUZ4fpFXcDhl7AERIyphFBcqD8k3JHX9VYqDS9GgofysSi3/+l65xDHeI+LnYc5Am7SNLLN46EdMm0xmKPRQjn/8=
X-Received: by 2002:a81:6c4e:0:b0:54c:288a:a2a1 with SMTP id
 h75-20020a816c4e000000b0054c288aa2a1mr5593718ywc.27.1682736415063; Fri, 28
 Apr 2023 19:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 29 Apr 2023 05:46:44 +0300
Message-ID: <CAA8EJpqqhP1QL7TuW8JXeVFqukWggYmB1XU8OeB65fQA+jhLAg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 0/7] add DSC 1.2 dpu supports
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
 quic_abhinavk@quicinc.com, airlied@gmail.com, andersson@kernel.org,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 29 Apr 2023 at 02:45, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from [3].
>
> [1]: https://patchwork.freedesktop.org/series/116851/
> [2]: https://patchwork.freedesktop.org/series/116615/
> [3]: https://patchwork.freedesktop.org/series/112332/
>
> Abhinav Kumar (2):
>   drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets
>   drm/msm/dpu: add dsc blocks for remaining chipsets in catalog
>
> Kuogee Hsieh (5):
>   drm/msm/dpu: add support for DSC encoder v1.2 engine
>   drm/msm/dpu: separate DSC flush update out of interface
>   drm/msm/dpu: add DPU_PINGPONG_DSC feature PP_BLK and PP_BLK_TE
>   drm/msm/dpu: save dpu topology configuration
>   drm/msm/dpu: calculate DSC encoder parameters dynamically

Another generic comment: this patchset doesn't have discussed RM
changes to allocate DSC blocks in proper pairs as required by DCE.

>
>  drivers/gpu/drm/msm/Makefile                       |   1 +
>  .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  19 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   8 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  26 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  35 ++-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  26 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   4 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   2 +-
>  .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   2 +-
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  14 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   7 +
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  16 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  14 +
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  14 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 102 ++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  36 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  22 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  10 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  14 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 335 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   9 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   7 +-
>  23 files changed, 642 insertions(+), 116 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
