Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745D7C5486
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 14:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C7D10E7CF;
	Wed, 11 Oct 2023 12:55:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3EA10E7CF
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 12:55:56 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5a7cc03dee5so18621327b3.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 05:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697028955; x=1697633755; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EMpanbuMcLckus9ZARSZ53Uwja0e50NWNJtv+xhA5TM=;
 b=KaYUuZqZeN4wjd5zioAWpKmCiLrX6Igmv+wwEfMpy3qdYBeywJj+z/8l5UYkF+AYW5
 Q0aW2pSkBW6re4WYbROHlzvhbXXslRD59GEAqdqSKqxzXMCKBuP/Suds6bVaztMpLgbn
 fY0QuldVM7tjL0/fBcq/AHnZxG5Szaidxi9gENyWEpFLhJJqIM634y9htjmLEg6eD+pJ
 IX/9agYBDV8Z9V3g1auDyB1xXo1psGuuR4dP+z/otBPys+hQ4dC463HXblet9ZZ97+zJ
 dDYM8rOB3jbUsPH1TYHeWXUln3vFVxrWrO5KumvMBWJjqby8Y8iDO9goBvr5ZVAWFPEr
 LWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697028955; x=1697633755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EMpanbuMcLckus9ZARSZ53Uwja0e50NWNJtv+xhA5TM=;
 b=YIhmjyzWMNb0rS1DtDKyOgGM35fuPbRWDGzi/e7xb0eWf6hLyGoLmas9uJpf3ogB/Q
 Pi/dA3wcNmktlhIE13N6ILccoNIN8kPTWW/EsSdTmhvqGRg06nUPripJPbO7eKaS0s1t
 wD/nWljgVCYIsHxbv7c0abup2r8oSmIhJj55yI3WBHoc96M2nQjBA21JBEPcFgHDe6Ht
 7bdBNw4kWa60/fJ7UneCUqkb9Ek9ZvWHpKLbrWFxVVIlYThONv0d0pPv/BZTvJVrUwL5
 lZKtPaDs+IlO2WVi3IUiyk4bE8TW+tBelmT1gBtU9bhyIPagZhmtl7Ah71YbYEvQIbrK
 2RnQ==
X-Gm-Message-State: AOJu0Yxs4XGTNCjZdLSnPByDJ/TsrtNaQ0ESzAP16ufRpWFK/ic0GpMu
 EG07YxwNW05FNNXCDnAjr0OeCR+j5VVJCKbv9ZkFkg==
X-Google-Smtp-Source: AGHT+IEIo1rpWm9ozb2LC8BBsWDuwXIWlIvdWVu7bjYXOoAjwOwLrnyyqhLenYE18qjjRDtzEBTv1V0bMC53GjFv++k=
X-Received: by 2002:a81:9149:0:b0:5a7:b782:6dd9 with SMTP id
 i70-20020a819149000000b005a7b7826dd9mr6553527ywg.26.1697028955491; Wed, 11
 Oct 2023 05:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
 <20231011-topic-sm8550-graphics-sspp-split-clk-v2-4-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-4-b219c945df53@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 11 Oct 2023 15:55:44 +0300
Message-ID: <CAA8EJpq_DnKseY_CGJ36V1v_vc2dsCS4UCiEYWnbfz4Cp5vtfQ@mail.gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 4/5] drm/msm/dpu: sm8550: remove unused
 VIG and DMA clock controls entries
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023 at 14:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> The SM8550 has the SSPP clk_ctrl in the SSPP registers, remove the
> duplicate clock controls from the MDP top.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 20 --------------------
>  1 file changed, 20 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
