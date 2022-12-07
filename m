Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6990645D29
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 16:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C61210E3C5;
	Wed,  7 Dec 2022 15:02:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FBC10E3C5
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 15:02:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id n21so14594129ejb.9
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 07:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rkW+R4a4Tse6+MACAktrvnQJHvMvBdaXyWKhbIEKa4Y=;
 b=fkHTwS2xda8lXWPwC/vh6Sh3dsVuHW6pI5EwaLzpeW2PTehU5ETuWBv7ToCAGRlohi
 8PA0gxeF/NHGRup1QG2jbLwskMNCfUY7Y/w2tc3n2CcTY0CgV6VOsnSRlehtDRv0l4ho
 6OmIIbqIKTUeZu0L5HPuVvlFENu1fsb4bC/UA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rkW+R4a4Tse6+MACAktrvnQJHvMvBdaXyWKhbIEKa4Y=;
 b=jK4UzS623MJT273QTvw3oN3jr4snksmOWImLjjpYUAr6x4b9jfQ7uvM78Q9iEblhNo
 tVRyWtTWST+/V596zk+/LZRFQEa/e7UnEEtP65kMOU8H7+oRXO3XFcuhWmZP1BSZhyGe
 bkhwoOcFnmLXi1Sury1uIiDAics1QBA3S5qFHtzjqJrDFSkHnwb857lMSXxPLuqBcJAp
 pGqNxRi7t4DfJg81Up8yjwsmCV5WVXCRdRjKNPEdWyTXaSaF7YG+aXUuCyjma32auZ+Y
 hWAKjNGB1Gh8L1U4+KSGuUwQcX0YNlrEFqIsZ1d5knfMgK1JlT4JUtPvFKN9B6SiyFy2
 exWw==
X-Gm-Message-State: ANoB5pmWmZ188JMyaTAVqc2v/puDQn3orR+ZIeHHdGwdg67h9rRRLX8F
 bJ5sw5DQThwB1+ou6N23xRLT7jYeJzKGUehys9o=
X-Google-Smtp-Source: AA0mqf5ahE/TdZhOhc+mFRn/YLucabotfqDSWFvQE+LTjd9hM36b3Sq2heTYn+eAEsjfQuh8cwSf0w==
X-Received: by 2002:a17:907:b60c:b0:7c0:54f2:af9d with SMTP id
 vl12-20020a170907b60c00b007c054f2af9dmr578385ejc.37.1670425334562; 
 Wed, 07 Dec 2022 07:02:14 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 h23-20020a1709060f5700b007bfacaea851sm8553107ejj.88.2022.12.07.07.02.12
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 07:02:13 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id bg10so13842655wmb.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 07:02:12 -0800 (PST)
X-Received: by 2002:a05:600c:1e12:b0:3cf:9ad3:a20e with SMTP id
 ay18-20020a05600c1e1200b003cf9ad3a20emr57361645wmb.151.1670425332189; Wed, 07
 Dec 2022 07:02:12 -0800 (PST)
MIME-Version: 1.0
References: <20221207065922.2086368-1-linmq006@gmail.com>
In-Reply-To: <20221207065922.2086368-1-linmq006@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Dec 2022 07:01:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VDQZu_-kDOQVLoz1SNPda_78aQ+NMa163mXDmnmXrRSg@mail.gmail.com>
Message-ID: <CAD=FV=VDQZu_-kDOQVLoz1SNPda_78aQ+NMa163mXDmnmXrRSg@mail.gmail.com>
To: Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Fix memory leak in
 msm_mdss_parse_data_bus_icc_path
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Dec 6, 2022 at 10:59 PM Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_icc_get() alloc resources for path1, we should release it when not
> need anymore. Early return when IS_ERR_OR_NULL(path0) may leak path1.
> Defer getting path1 to fix this.
>
> Fixes: b9364eed9232 ("drm/msm/dpu: Move min BW request and full BW disable back to mdss")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> changes in v2:
> - move getting path1 after error check for path0.
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
