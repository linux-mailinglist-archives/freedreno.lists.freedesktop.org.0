Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D9643635
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 21:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5152010E2A0;
	Mon,  5 Dec 2022 20:59:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442B510E299
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 20:59:42 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id c1so20514294lfi.7
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 12:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Bgy+f2L2rbGOuAQ7U6WSb8YGwu0T4H70GoPKtOQnTKw=;
 b=CFlqt7da3YJEIvnrTwB241/AGjRWUuGLzB5DGhs7yvvo1pGgYEQSybv2RkJO4fIUBS
 30MMfLZiIqc5laEZZf5HbB0bZQLl+RU8HRYivJe2uqPNUd7MoR8Z+MS8aLd8UlIxK4JN
 b5fhEi+vqzJRA9iVRkXh+jxWYeK3D4Bo38GKGy5OfSV7WYhJFvl7EN+MX36abDSqdlY3
 E0u6Dwl8brybOa4Qiw29S/PMYZBX+vuNvxm01AeBF0ehFWpUl/f1gaFmMh+gHAJDjFtG
 SIMo+rfuK/eJ0Y62NqGMF0TnKd/RCwtGRgNP/8OOw80iZlsP8za7r3G9/EYc6ZaV8RbS
 jV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bgy+f2L2rbGOuAQ7U6WSb8YGwu0T4H70GoPKtOQnTKw=;
 b=QAFXWAB1bT11WwfpHlJ6iU4NksZ3YSyfxoZUZ703tXOn7o22kuH9N/OiG5OTu4WnxD
 JGH3U3NYmNYJ2ivks93fOeD27udk0HF01RWPe8AvrRABmTP6cFfM6kyFJTPpIAcGRn5p
 +T44QtqCd7wk+TDw/tE2Rx8uEuNZ0FCuSwUHqHBa66zNFGnTk6BThQSnVm0qDVmCRXS+
 PYbqnpZql+1K/YYtdZEsCHHh9Gs88WfsBDyGh3kPm/eBL43f9JnxL43h4lwkFn4dMqpg
 wkHBywwgZu6JCYTloVqduQ9LO11sP5mjo0EOlMi7wTuJLOpq5FdybGUBY4Ai4TvfJA7C
 TKZg==
X-Gm-Message-State: ANoB5pmrU4+CMjamwYzkhLITUhd567B6BcaIZrDKYwmnqK+/sFQ0FJwb
 BjbC/V8knJxaI7nGjTODDO+RPA==
X-Google-Smtp-Source: AA0mqf68QUVq95pZFc5bKU3wSaoKsO3Awljf51PvcoFMkTesiOnzMn7rQACunOavaTjQqgAEnhQ31A==
X-Received: by 2002:ac2:4bd2:0:b0:4a2:61b0:8d28 with SMTP id
 o18-20020ac24bd2000000b004a261b08d28mr21493095lfq.600.1670273980652; 
 Mon, 05 Dec 2022 12:59:40 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129]) by smtp.gmail.com with ESMTPSA id
 k20-20020ac24574000000b004b55da14ba8sm1128333lfm.291.2022.12.05.12.59.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Dec 2022 12:59:40 -0800 (PST)
Date: Mon, 05 Dec 2022 23:59:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
User-Agent: K-9 Mail for Android
In-Reply-To: <20221205174433.16847-4-quic_bjorande@quicinc.com>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
 <20221205174433.16847-4-quic_bjorande@quicinc.com>
Message-ID: <A185142D-8021-4879-B75E-2C255A7A5A21@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v4 03/13] drm/msm: Introduce SC8280XP MDSS
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 5 December 2022 20:44:23 GMT+03:00, Bjorn Andersson <quic_bjorande@quic=
inc=2Ecom> wrote:
>From: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>
>Add compatible for the SC8280XP Mobile Display Subsystem and
>initialization for version 8=2E0=2E0=2E
>
>Signed-off-by: Bjorn Andersson <bjorn=2Eandersson@linaro=2Eorg>
>Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc=2Ecom>


Reviewed-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>

>---

--=20
With best wishes
Dmitry
