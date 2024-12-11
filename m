Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5267F9EDA81
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 23:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDBD10E63B;
	Wed, 11 Dec 2024 22:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="k9nw99Hb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DC110E63B
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 22:58:54 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4674c597ee5so39047531cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733957934; x=1734562734;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=d7oul3/epjfIWJpF9pC+/pDis54zJFCmAnINjv8ddgk=;
 b=k9nw99HbQRPecoOI9s0rfOWi2BGN5u6N6vR8cWDzKW1gOwUcZ07ZZznUi+NLL7VWe0
 4C+dKnGNREvBvnq/S7Puf4TFBVYesyuZKTepQ0W+gBINRiaNwsM4Kh8Sdh1dLBGXLP+3
 N45yZyLqHlBGrZpBlfJED5fPbhxcLLRxNxaW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957934; x=1734562734;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d7oul3/epjfIWJpF9pC+/pDis54zJFCmAnINjv8ddgk=;
 b=ouU6XSsEIVpCFt7H3CnjK2aqD3dJqtY+EewZ2PMpkL530uwE91pXSHA0BT24wRxYj6
 0nt+kWVJGFXdxGP8RSuKczCr0k28q4GNboo+u2jmff/EAilhxoMwltbE6Q9hSRMYhm7I
 6UNjDd+p3W02wzwfrBXJD0kDZHU+n7ub48J5LlD7MgDb5u3fyvAXxEXmP0N3qgA8rvIx
 brpgghSrjPqP/5wbXXA0Wm45LEc9X7ss60QdAr48PQD3wmtO1qJPFdNLN6qz00oosgWi
 I66uCEl4puIC/du7N3gLB9zIx619ziyuOt5fmdKDUntywlmPZ5X29K3aaTNYaIcbYNLD
 AcFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZJKL+yeQCgdBsevwCf2FOqw2Mcn+qu4Qoae6f6wsgWqZSMgwP6Y0X98VCBpv0cHBGoLPLCG9OZwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO/aGyV1mFTgWaOrD5hrXOI7n9qBgFP70/4pVS0Uru+OwDph32
 mQOicATeSerLY3OI52LTXTH9lhdjJY1c5wmNcMMxoa0UBJ+eLn0gK3JLv5m3w5ofl2aObFkRwJF
 JP8bzOutXjbMdEd0eMOENXcnTK5aY+yoR6k1Y
X-Gm-Gg: ASbGncvdvu8mYdVoACPV4K8vSseJA7QOAXxDak8jBkDSjxkmmB3AvPxtYiVhIeb55z5
 fxkBDJiqCWJDWIuU/Hp8t/cdSI9i/LZHYMExnZAB6QUINIko/q9eHHJNBeIM3uSg=
X-Google-Smtp-Source: AGHT+IGPvlar9kD/U1IZ+NJKxYLinjgrZQ9MpbRulgpuokUWHWjoaaMJU+Xn5x1nVqU9KmYDv8PLu/rJckgmgpIo2wo=
X-Received: by 2002:a05:6214:5293:b0:6d8:8cb0:b40d with SMTP id
 6a1803df08f44-6dae398c5efmr20747426d6.39.1733957933934; Wed, 11 Dec 2024
 14:58:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:58:53 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-14-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-14-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:58:53 -0800
Message-ID: <CAE-0n50Ae+HqW2ZvZ5n=zgw0ZNA+ndgUFf_vFXZs3uzj3VPQzA@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] drm/msm/dp: move interrupt handling to dp_ctrl
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:44)
> It makes it easier to keep all interrupts-related code in dp_ctrl
> submodule. Move all functions to dp_ctrl.c.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
