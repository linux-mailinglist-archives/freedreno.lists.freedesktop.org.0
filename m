Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12689C6F0A
	for <lists+freedreno@lfdr.de>; Wed, 13 Nov 2024 13:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88B610E6E8;
	Wed, 13 Nov 2024 12:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j8V9y4C2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C7A10E6E8
 for <freedreno@lists.freedesktop.org>; Wed, 13 Nov 2024 12:27:57 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6ea1407e978so60778747b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 13 Nov 2024 04:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731500877; x=1732105677; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KImKDqWq4s21FhX0T9TYJY9R8T8zry6WhOX4TLZUuNk=;
 b=j8V9y4C2/dQ3Lyh9KbTsMlE+FGzSSyeOcfGHYcoxWzqhz4LCgHLyv8WUhH+zvlQkyP
 hGNx9gGI1aQiOn8INIIpCsh09y6dQlW6pi0T4U4CSYETVuTeFidadmQjGKKftaSbKu7B
 9ffIYvb3tQmyy2fpqhI51EXCmMLwgF0GzbqAIFTiKyAvxaIKiuxKPmCwsmd9XnsshtBA
 kxz08U8ax056Q7RpbWW810BVffLaP+GhF5OWTLXX53cj6m7SPNNBGogfbmcWzoI3oGHb
 An0J9XPTzIml7rs6XP+GCLsIpcvrRv0OJX2N6JvwPN8KlDKlRjDefffLwPvQwv0mZVHH
 KVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731500877; x=1732105677;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KImKDqWq4s21FhX0T9TYJY9R8T8zry6WhOX4TLZUuNk=;
 b=HUpCqGev1ts24Jf86KiMePwtYsxKkPhXYse4cfv6foaf3hcC5QeDuZ2Ex8fzL+JCGi
 /Gz1Bl8zb/lP6fFL/a9eIrhG2g7noqZjhmiyq2tCcCg8+K/1OLJQS8HGKeht0jG+gaXO
 W1G8mGkkrafkv9U1kKr/MWdpHCf8cZkEBKluddlua29f1Vo2BubjXz/UfNRWOGlTLYbf
 1YBBGTKLuhY0m9SyfvVZf5wL0pIstX0KqfdNk2fSWcQZxHf0Lf9Q+v6BvCnd0w6O1dgn
 u8AFei+J7wcSjaOklciWiaL2ykwKGKqPU72phcY+4vEG40MEmO157Wba6xsWT1mIF8Ka
 V1fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRBTKqH0Mbiav4rC4/RP0kDTqFSfPrYCFa1PKd0OpEWLg/+zL0I/Ovume/SW6+XJg4JE4K6aqZBIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOfs1596dpqIgubQT2TamCdrAzMzd62T+SvaLNoU4OdSywl9Tf
 w41Vg2a6BhivyJ0wH7PhToNW5UfOCLPiMKZRY8oajhLI7iZyAJTiY78qZPaSrfc9eChNJM65sQh
 B9PgaYgqgxhseglMTQiERC7konXITfPzpDJ3cKw==
X-Google-Smtp-Source: AGHT+IHaAWOdAgML2ba4DzOA4z4U2wezC3VkawX20A2dPxMskv1IqJdFG+uwKU9K7bhxa9QyXticQbkM331fssKDcLk=
X-Received: by 2002:a05:690c:30b:b0:6e3:16da:e74 with SMTP id
 00721157ae682-6eaddd9418emr194176117b3.16.1731500876873; Wed, 13 Nov 2024
 04:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-8-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-8-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:27:45 +0200
Message-ID: <CAA8EJprBxL0KuOm4f1peRCw9Y=bzXo=Vt-QEv37RzJ62zJriNw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> Add display MDSS and DSI configuration for QCS615.
> QCS615 has a DP port, and DP support will be added in a later patch.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 109 +++++++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)


This patch has even more feedback that was ignored at v1. Please go to
the v1 discussion, respond to _all_ the items, so that we can actually
see what got ignored and why. Usually I don't require this (we can all
make a mistake and miss an item or two), but with this patchset the
number of the comments that were ignored is extremely high.

-- 
With best wishes
Dmitry
