Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A66C7DB9C9
	for <lists+freedreno@lfdr.de>; Mon, 30 Oct 2023 13:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB2010E2A2;
	Mon, 30 Oct 2023 12:21:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE9C10E0BE
 for <freedreno@lists.freedesktop.org>; Mon, 30 Oct 2023 12:21:02 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5a8628e54d4so38100297b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 30 Oct 2023 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698668461; x=1699273261; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tx0E1lO7sX80TYEZLbZ/p7IN8KY+xevJVJVX9CSG4+g=;
 b=de62hGDRxlcVMtj9LDMk9pdBf+93GoHhuFf8PwRKboZBHgnCRMbMffyJi+HxWjs2m2
 NXZrKDIg2dOLUeAY591bHuqSvrcQT/7QnNWs3LLBD9K0gc4XquvgtiXueBrCVgJH9lBo
 rXg0ErL/HNJjJf/zAsOOyT8UQtvxTw/q+ILaNmtiKSSZRVII+8EQUH7RFR1O64kLlXOf
 396hHT278s8qe98//nWaEEctRkEQxaGpXsGh5zvL0wIYtEkKH6ZtWFvnFmZyH3PGzKR8
 /kH1LkB4dE0EBg2tXmoRIxd+h9z5wDAJj9zGY1BKMYN9IuFQsdiw7oBCNIZ146vxYDHk
 xRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698668461; x=1699273261;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tx0E1lO7sX80TYEZLbZ/p7IN8KY+xevJVJVX9CSG4+g=;
 b=ituw1zShPSykMuEZdcs5eykcPnV//J3EiD9FsuzelMY+HjlOvr3lv0o3AhYlq4tBZc
 P1yCa5Pgr0HcxCBUQpzkW93NKgbhH30PLLU9CGN7N9eIU6HNSoLRc3B3dvJjwlFXEXlW
 xy6Qwp0zxdbhMd7bFQsSc4jrvf7MyAXn6gO2IrSp10+ZNwyDfdx93CJn7j+NGo7PtGV3
 UwIWY7MInMd6WKYyxwBjC4hAHJE7uTk7nBjOo/kDs7m1f/85trb7JgVASMUBYT3BAbDD
 n1/bhe1TRcbb7J3TiP7+OZJEcq/dRaalruf5eyg4LtAN0mPo+RPw6FRZdTMPReFRGHHG
 Nhcw==
X-Gm-Message-State: AOJu0Yzpk/OBQf5/JlxxIMuU6mnqhzIHDCAOaYU1NjSr9TrvXd8q9Th1
 ycL+XxI1WDwwNW3yWrM0Mf/1jUb+LiCGoQaqqC0mDA==
X-Google-Smtp-Source: AGHT+IFKE8vLRCh0SuUhxTnn5PdhE/o7DyZSiHlRWBzISa81u1bz2zPdSgaIvbzp7Wc+FD7P0CwSUInn+dj6DwNZIKw=
X-Received: by 2002:a81:441e:0:b0:5ae:15bb:466a with SMTP id
 r30-20020a81441e000000b005ae15bb466amr10123206ywa.14.1698668461455; Mon, 30
 Oct 2023 05:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
 <20231030-topic-sm8650-upstream-mdss-v2-5-43f1887c82b8@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-5-43f1887c82b8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Oct 2023 14:20:50 +0200
Message-ID: <CAA8EJppBTOnSAWLpZjHAGwwfQzPRVgHVmDfN4nvaVifU+2xEOQ@mail.gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 5/8] drm/msm/dpu: add support for SM8650
 DPU
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 at 12:36, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Add DPU version 10.0 support for the SM8650 platform.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 457 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  26 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  5 files changed, 488 insertions(+)

-- 
With best wishes
Dmitry
