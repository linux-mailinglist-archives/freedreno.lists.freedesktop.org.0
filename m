Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234AE9EDA74
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 23:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D6710E633;
	Wed, 11 Dec 2024 22:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZZ2nZaL0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B377610E633
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 22:54:46 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6d8fa32d3d6so61733686d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733957686; x=1734562486;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=RHwlBu6Z4VBS0gNpoSsmbFxwAtZwdYd+jvGCWb3rbeU=;
 b=ZZ2nZaL0uaQlsx8L4cWPeb9aduSAnk7LwsFj7AboKW6otDJ+AZVxs3m4+qBolYjcAW
 yb4e6HHPb08zjNHt3O7F0y+DAbx3n5kU1YerBnB3KV+VAlRuCY+uiN9C00EKGGZEIqo+
 e0Cddy7LUa7wMJMq+ESMYadlrLKIG1QqGWTa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957686; x=1734562486;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RHwlBu6Z4VBS0gNpoSsmbFxwAtZwdYd+jvGCWb3rbeU=;
 b=EQjjrEgyU81hrVC+9FcHDkVy8Qu4pb+c/cAllftEsv5UVJ1WuF+80IDTvPGhODwHET
 TX8IzKgAzpES3v6+aA9IXtLat3cBHssg+qciDSkukjf0akVKIp9p8bF+jTQTwVzZLvdY
 47YUeaYguJeLIR0fBFI7q8kU2+k2vyqWTLHS8/kcyAqCaoZmaZ5sf9Qgv/zJWBpR7EOY
 uwtkIv0TAmrf80GAhhjJSgLrDuBjNAw3kLY1DGKt96fD97W5QTnrqEZyGvWIqdOj++EQ
 e0g3x94SL0ebmtGD4s5jqXCu0vfH1Hzm4KFx2+0I9ccoI558cBVvqZliPHvHF1kvJuMM
 RFGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXzu+fTzoDulZJ22FKjUnKrb4tJtMwN1FeBvUCexeCGuBNghTfzvIXaiVVESYZ39MeooBwreK+Puo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTW0Lr9iqBEdjwsSdPa9P6ei8crLJR95Dn9P04St8J2DzuhQqQ
 BtGsiTZbc82CWJonSlCPs/KnGIvULtM08WHmWELV/fsjIOaOYFnNcRjZIyiv0zDvBeozFlVnqXd
 Vq54AX32XF8Spvrl6cBUbuoXkGC09O54Gp4QP
X-Gm-Gg: ASbGncv+ifI04NIaMC/zVWxiIYla3clmCSsVOGaLiS42zbxcLwXXAysxGUYExGIMIUH
 TM+F1EJ3HjNN5RQSx0OI+4Q7oHGF/nXfZY1D/oNUcetkPyNnzJmbhXf0CXGq9BwI=
X-Google-Smtp-Source: AGHT+IEGC9lOWNlVRcNf6fxO1C9k5anq2FzZawxvc9QRt3uAELPSdgB+RMMmxVMt78OAlW3P2cd1g7RFAijwaS3fIQA=
X-Received: by 2002:a05:6214:27c2:b0:6d8:850a:4d6a with SMTP id
 6a1803df08f44-6dae38e5086mr22115606d6.1.1733957685843; Wed, 11 Dec 2024
 14:54:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:54:45 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-12-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-12-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:54:45 -0800
Message-ID: <CAE-0n509sQEBscLmRCBMBzgYpWX4=62+hKtHcdE-W83LjdcqPA@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] drm/msm/dp: move more AUX functions to dp_aux.c
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2024-12-02 02:06:42)
> Move several misnamed functions accessing AUX bus to dp_aux.c, further
> cleaning up dp_catalog submodule.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
