Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA5480A21F
	for <lists+freedreno@lfdr.de>; Fri,  8 Dec 2023 12:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FEF10EA6F;
	Fri,  8 Dec 2023 11:26:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD3E10EA6F
 for <freedreno@lists.freedesktop.org>; Fri,  8 Dec 2023 11:26:25 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5de93b677f4so4643357b3.2
 for <freedreno@lists.freedesktop.org>; Fri, 08 Dec 2023 03:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702034784; x=1702639584; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=byPYVY3l+3OcfSeHRN4sVPzEvG910jYH3sPHi/VI4Xw=;
 b=MORYglTqYyIIe1Vqi67q8bTuizqJfvK81LFC4MwsDVZtgOxsNieo7wPHA3MqU9OAzO
 iSd2d4W4ar/PsJUJh79sufdYNi36V+K5sCsJFfNmhMN/LGxXKo1gGz6xKAoaJ8Owb6X4
 6BQh/Yg7GV0Ci2jFeF+6P9/Q8qb4g7mavyMWnQ6zQ/aAh4ZkU3jpTyaKx0lCCXgMnCuj
 zWjRQ7vdtDP3hnlJ4KUfgLjoy19/girWhvfx4AkuIxH5zAztilE2eXJRS5ZDRb/CV2Iy
 LPRa2okXwfH4JMJCw0DpnN9AQK35GsLw/2852LaCBY+mPv11KvAuAg4wO268jr1bU7JX
 OkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702034784; x=1702639584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=byPYVY3l+3OcfSeHRN4sVPzEvG910jYH3sPHi/VI4Xw=;
 b=kmd0c37eZIz2VvoIctuqd6vzxIQvqgfXAS3zaGr/kTCbcNTlDIkn4Uq+pNct9ZDYV3
 ZNqoEuUjN85oVffugbjPV1xNKX8zeDNIs3AqoS5Nmfdq/VWFYFQjd3/JWRZN8T0AsMqK
 3WSTdjOwIegdDaAFQ140dXdid2Xz33XQTHvv2FVcsvmyfGBlsGXKd2mG0v3IeKmBflur
 4zQm+hH1RygVcWIQbMPNvv+jaVnX2hGJch1kDGq93Y1CBAYSvtUoGQUz+aEqPPqtO5lN
 q5hRzPfl62XrE8udXU2lcLEo01xM21XyQZIfM5R4Ac0WhdhXYIubD3eY5ErNECThEgO0
 5SDQ==
X-Gm-Message-State: AOJu0YyfpRETsjPOqyZMWBPYx07C0/ENAwhZO9bJY3N0NThs4yOdO8dF
 8yzSxgVdGalCKxnbGh4snJJ6WfjqMe6g6HicXSFpIQ==
X-Google-Smtp-Source: AGHT+IHGGsTbAV5EBSGKjADTA/4cOM5MMdVRwIFGYX6nSYYueDpA1I/YNSvKbKDV21cpoUlQldGOr9DIM2R52NDc8GY=
X-Received: by 2002:a05:690c:c84:b0:5d3:d6c3:dcf with SMTP id
 cm4-20020a05690c0c8400b005d3d6c30dcfmr3647433ywb.15.1702034784451; Fri, 08
 Dec 2023 03:26:24 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-9-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-9-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:26:13 +0200
Message-ID: <CAA8EJppNfznTQydN+BDaFpHn432gAhHUJ+9pOvq+bV9pvE=qAg@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] drm/msm/dpu: add cdm blocks to RM
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, quic_parellan@quicinc.com,
 Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add the RM APIs necessary to initialize and allocate CDM
> blocks to be used by the rest of the DPU pipeline.
>
> changes in v2:
>         - treat cdm_init() failure as fatal
>         - fixed the commit text
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
>  2 files changed, 15 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
