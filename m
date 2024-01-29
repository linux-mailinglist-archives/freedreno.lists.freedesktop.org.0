Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43AF840979
	for <lists+freedreno@lfdr.de>; Mon, 29 Jan 2024 16:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB28710F79A;
	Mon, 29 Jan 2024 15:16:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8A41129A1
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jan 2024 15:16:18 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dc24ead4428so2045793276.1
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jan 2024 07:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706541317; x=1707146117; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=19g3oA8IiRUGTXPpvDGJllhbr2rfvg3/xxxfKuMshKI=;
 b=zxUWwnsJZUD+Zm0PFdSj4dnjQVMR9uJ3wRZCCMOcHO4lFqP2zWMycpEbsQnC4wcJJF
 pI+y+RH/F+Tnj952bgJqULYDl+aE7CLU/ug/3QP+n/3W1ab3j6KEvVx6A8Gt7bgHogfs
 XG3pnLBCwICRuoRvRuWbYDNXg6A7ZrX1arXv5BQ2+9N6GLZaMCP6UGXghfyVseRadd/b
 ABp3zs0yg1CegRzhtqTuCXI5QJPfNT4kgEaDzsI2vgWOanJhf8I8YJj5de6Isdv2wefL
 D4Eb6boEMiHBuMizWXTBhTmlrL4XZ44DiCfgFjotR7jPBJqWv5+VjKYPtzm0ipKXF6hT
 KK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706541317; x=1707146117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=19g3oA8IiRUGTXPpvDGJllhbr2rfvg3/xxxfKuMshKI=;
 b=YV69TbeHiOPNpPieKT2Kah6L9zksjUxJCqPtSgTGPfbsrXlaUIlhp1NgGW4hfnFr7/
 bckaBIyPxkgRP4qwI5sU/e+NG1TEjDaw9+AL4rFs5KXHGroBu8+0m2FrPaUOIO0FtTpq
 z7HauzqXoyf9EHI1bDuUhC3hBNvbSUbqJI5nkDHQAhE167HMPYELP9CZ03hBEQ4gcW6S
 XfjRNb+v6a5chyeWWy/VELP0YjDlPbwR8MY/LkHxF3uF7Qlc2FjLhPUfV8MITsiWgNf8
 YcO4viOOrQdQTSZYwiQQXU208i9O85+Y51CLBSIgYGVMT9n2nd2/WLPTFgwcXc8Vi5uo
 iFeg==
X-Gm-Message-State: AOJu0Yz2eBULfXShcTRgjRlA/NIMAM3pKk48+oDizWSbeanweZMNg0Vz
 3uK7Jfhbvg1+SCxRMfh5o3owOibCF+BUdUaWukc6DJr68fAmsUxnTOi8mpFHi7yr++wA7r5rlvn
 VvNo6F3aIy4uIl/WDzL+HWH0W51SMQYDJyNveUA==
X-Google-Smtp-Source: AGHT+IFydtOcrIJRlNoXpg56zZ7tHX71n5y4JJpZgFrLYNKvhBr3oibPkEQ4p09wGzgkORErJGWYlBptWzGE6KVbIJ8=
X-Received: by 2002:a25:ec0a:0:b0:dc2:52f4:2356 with SMTP id
 j10-20020a25ec0a000000b00dc252f42356mr3387101ybh.119.1706541317649; Mon, 29
 Jan 2024 07:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-5-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-5-0d9eb8254df0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 17:15:06 +0200
Message-ID: <CAA8EJpp_S4Ug8WoiQ5f3hEESTy9_u1wOo-ETMD2Tky1_OQH0kg@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dpu: Add X1E80100 support
To: Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add definitions for the display hardware used on the Qualcomm X1E80100
> platform.
>
> Co-developed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 449 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 453 insertions(+)
>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
