Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD0698AB8
	for <lists+freedreno@lfdr.de>; Thu, 16 Feb 2023 03:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67AD910E30C;
	Thu, 16 Feb 2023 02:58:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AF710E2B2
 for <freedreno@lists.freedesktop.org>; Thu, 16 Feb 2023 02:58:08 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id l201so646238ybf.10
 for <freedreno@lists.freedesktop.org>; Wed, 15 Feb 2023 18:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YyMZCQmaOL1xm4zqLG+BHh0sREN8jgVyVG/p8ktPj+c=;
 b=mBTcMWPuiflyd2oc/5m7tNXF9fuV2y8N6d1q0h1Qj8DIsihq+Rx5Zu3ZxARHaYmuHh
 TyHa1FOKITLUVKOuB4LkvJux8vM8KYSjlSMBMfL3fUwUO4/TxidApfDlRXmyKRYoNp3+
 HKpJIthTDoyScFvmhFvfHnwdn0UcnY7NvkNQVo4vahQFg8AnociLC+3ysCCwm9mvYF+L
 m5Rr4uFetZBqVNS28SPcAR/GLaVUY0eeylDf7gjpVYajIEAYe0a0JeodButx/u7eTcY2
 hZXhgUOMJtBJDE8GCUPktK/RabH20AFq/8/5F0b1OydzjVIye8RX+8T/24MPQ3wjn6IR
 HeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YyMZCQmaOL1xm4zqLG+BHh0sREN8jgVyVG/p8ktPj+c=;
 b=yBRz6a034+5N4q5EO+oxF9JCcN0njxyhPg0zU3q8LnNjoS/wKwGKamDlfBZDiqTVYz
 TSp5oH/NaFSfcMEZsltn8tCTVOZiqaO2NQQrOmCvkXcZ182EATNsSK7KoYXbZ/36T/kd
 f+b0bpFXiZqiuhghhKnf2YbxqySb2o45lNPougB2d/03ZnnTSCCyhaZHjGz/zSStZ7Zb
 so0x9IMKuz9doNG7i4Tjf+zGnXIczeycez3PCjjmvhqah4CVweLax1sQr9rpDVd0TqBe
 qIrkYorcVHpQ+HST43g1b6eT+T851wYlXZ1LHWaZa86b/6DDzc9y6AN/vxg5GDUGHYSF
 2rVw==
X-Gm-Message-State: AO0yUKWwstzQH6E3ZChUY1lb2iBj71yv9gYArbq6IxioqvMHthfhArUt
 BcJe9oeiobxen9C4G5cJMx1hxVEQff59xp1W7zPulw==
X-Google-Smtp-Source: AK7set+nmSebDjAkALV0PNZZFrn4v5zED6xwiCkXHS5ZJibfE5G7fjdWSQOZ3GW6NWl5csCf9dRiUjSqbi/Ly8p7fAo=
X-Received: by 2002:a25:9a49:0:b0:86a:e417:b66e with SMTP id
 r9-20020a259a49000000b0086ae417b66emr531070ybo.382.1676516287570; Wed, 15 Feb
 2023 18:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
 <20230215-sspp-scaler-version-v1-3-416b1500b85b@somainline.org>
In-Reply-To: <20230215-sspp-scaler-version-v1-3-416b1500b85b@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Feb 2023 04:57:56 +0200
Message-ID: <CAA8EJpqeVkYyk-RxkODt2wyXy0fhvTgjs-5Ay8R3TV7ddU4zOw@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: Drop unused qseed_type
 from catalog dpu_caps
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
Cc: freedreno@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Martin Botka <martin.botka@somainline.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> The SSPP scaler subblk is responsible for reporting its version (via the
> .id field, feature bits on the parent SSPP block, and since recently
> also from reading a register to supersede a read-but-unset version field
> in the catalog), leaving this global qseed_type field logically unused.
> Remove this dead code to lighten the catalog and bringup-overhead.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 --
>  2 files changed, 14 deletions(-)

-- 
With best wishes
Dmitry
