Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1717865A9F9
	for <lists+freedreno@lfdr.de>; Sun,  1 Jan 2023 13:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EA010E1A7;
	Sun,  1 Jan 2023 12:27:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C5010E18E
 for <freedreno@lists.freedesktop.org>; Sun,  1 Jan 2023 12:27:38 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-47fc4e98550so217070537b3.13
 for <freedreno@lists.freedesktop.org>; Sun, 01 Jan 2023 04:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2bWIRx0OjUiiIyER71vIk1rtm1u64tQPJZk2feH605U=;
 b=TluG41Rwc+6pjqk30yxZybimGt7+O6R3MyNiv699OFH83tN10SaLOwYpWTdQ7AWgLS
 EATAkvwk3w+1SThVegNvSV1VPnkjnECmkS4ahcCnfTvIP8QfBYgW/Ia4ZRcA6Bqv8egE
 PEJfcqX/UDVfBl9JyJiUN+7IiIVLZ+0hZDrgq4AdDU7rpmY94WjS4m8euscKNFlEGgwb
 yRfJycNDBK+sRp2RfjN9aPZRGiGGDq2Ni3wozwXNsuEkagQreBC1nRdZINZhht5wa4eO
 P+NCQXiQY5BeMy5+j/LZjh8NCzOcUL0XR8c+V4980ORW0CQYlAqusTFgTJ7lqlgKlt9f
 XJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2bWIRx0OjUiiIyER71vIk1rtm1u64tQPJZk2feH605U=;
 b=oWu+GKLi/VMLp7bMZXAKQtlK2YIJD+ccx/s1bGdDH4m5YGR+HVh2BrWUDyhRl2D6mr
 b3nfIBgH8bNQXBTCbipZ6LA71SHBY+KVRhNG8BAPI2GQyHav9M37kHyblqDoUmMB7+1k
 XPD+LZbcfoJToig6lPA1nBzlhmsU6qikz3KU2S3ervipcl24mR9AIJZ8Zt5RVyPPzwA2
 KAllQqjuT9uccREdEQxSezn+ABNUBJELnvGtVXSS07F27JymEXVXvbM/44sRgzOqZR73
 I1raTD9ucv7NSV8pFwX+dU8U2wffY34HOXD9b18rp6xrS4+kJO/XS78IFCdh4V7cv4V8
 noAA==
X-Gm-Message-State: AFqh2krtUem/9PZQePwzV1mVsAvMBfYw0CIASnRH4QWNMkAXfcY/Ok4M
 MO4clvDFp5DBrPpDvs1ongYv+lotfx/M/Y+piTas+w==
X-Google-Smtp-Source: AMrXdXvMw65HDtWFdqX2AnBda4/ddwCGwlF1XJLicIXoOn/3Sx6jOAd2wcSVV/Qr+2ien1/O22ItMviPcZfEztg61OQ=
X-Received: by 2002:a05:690c:fd5:b0:4a4:7135:9214 with SMTP id
 dg21-20020a05690c0fd500b004a471359214mr210838ywb.378.1672576057902; Sun, 01
 Jan 2023 04:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-8-marijn.suijten@somainline.org>
In-Reply-To: <20221231215006.211860-8-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 1 Jan 2023 14:27:27 +0200
Message-ID: <CAA8EJpraCLQpWn3PZLz9BGYrESVdWmHw0LpNtcx9ntQ_9=HgRg@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 7/7] drm/msm/dpu: Remove intr_rdptr from
 DPU >= 5.0.0 pingpong config
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 31 Dec 2022 at 23:50, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Now that newer DPU platforms use a readpointer-done interrupt on the
> INTF block, stop providing the unused interrupt on the PINGPONG block.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
