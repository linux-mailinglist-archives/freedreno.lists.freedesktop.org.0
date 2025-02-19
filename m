Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A218EA3C5AB
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 18:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62DD10E49D;
	Wed, 19 Feb 2025 17:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yP4621A5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DC410E868
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 17:08:23 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30613802a04so73903061fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 09:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739984902; x=1740589702; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AkbkUwNAuEhe/BbhZNs3/ygs+aQHipW7xTCFebXTARI=;
 b=yP4621A5AdJvqKNaXTK7Nh2lzcLJ0+PRFQXuU3zhxU9I5bomdT23Fll5Dh2x7z4eTA
 Yzlt5KU3+VXATB4GUZACueviLukNVv4J9LXcCHXb0Rk+wySs62cIji10mLvE2ccxgGYH
 6LWkCo8SIbeuw3UAV97dJFiy6DWGhuqUEVDkg2EZRD5fpcN1UwYcof1XejlNlNyiMqSy
 /K+P/ZZ8E3C8fLXgRM22+n/9nWLl1GJEnhjN0pclA9bc/qAGlFHuUmJsdT98dXX3BaJ1
 e6e0Gw1LBGVx8NHIrp/T1W8BD02RurJoP+pUld7pDSzVClxNkrcS6K1ts2jCWEhKX/8U
 bHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739984902; x=1740589702;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkbkUwNAuEhe/BbhZNs3/ygs+aQHipW7xTCFebXTARI=;
 b=vS0tDOsbI5IVLxBeSONcdDZyPo9pHl4pvqqc4RQQQKex4lPppAYMSB5VE3oLAMiN7w
 9HHoBVMmmEBQC/qzi5w33bxJIow6DPRSQXns0MWWfvizIvvjwuufeBKIYN/tIjuF+RzX
 FnpK29yPvW6I4AR4CuBs7WrUoUc3+lOIw/F1+QDKdcmkLPYVUq7SiKvGINCzjr1O3iJ3
 o/EXOO27Iavj35iURv6IrCypha27DDB7fpEpuLWDewcXXHsQr/ND2MqyzXW5FgFtfxrn
 b7OpA77gpVvwmGAXnMlisqaRGRTc9HVxXcDXEoMRRByr5ZPPxh/bifkCebuWr4jjWmNE
 VbfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkiz2/LzJjbiJ75TgOSkWKEYvKoNWbdu2L03eEJQH9PhUYdpIpgYDAbBwFS6LXAr0PPpqBiq60eZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2vq69238Bkxxs/mBwo6RqTkKNNZqd8cAq+0VtgqvicHBhB1ok
 rVr6NBcZARS1htdPg53FYBiQOC5Tjr+Svczd8TlWeUp5fDvjpipbH5kXHGxsCOU=
X-Gm-Gg: ASbGncs681TEW7XDPfjM3YnAJI0AnnTNmWNJtxzqBlq7c6miu8e1D0w3QwD2LFCHtAw
 qVKm1uu+XQuPLyrrf/ObBiAxd2O1/UZDZHoKc/4lBEmRa56Y4MIgY3DjjtntP/pazDMVH5gPNNG
 /V1Mysw5zwmOExL35Sg1/6LMnobgZSpVJBWfMgEgRsJOSDJik6rnkL+41hogJBTHrXpyPXR90oZ
 9NOru0PATtVwWUGThEupUidH+CTQ72DlGpmiWY+E6WPnUO3NNQ5IIykqhVp5sAtlygu8WaYonDa
 bAfo4j8cC2JNE+f+3I0Oj8MlJvDWJGnTAqNXDVGhycjbJFNezrRSo2yKV1h3O3Qd9dQjbCQ=
X-Google-Smtp-Source: AGHT+IHte1Sutlq3pq+Edaji2NXEVszWbf8srrzfEIZM35OvWAtnBNuKusfR7DVo+dFSq5pnZtpuNg==
X-Received: by 2002:a2e:9dc9:0:b0:308:eabd:299b with SMTP id
 38308e7fff4ca-30927a2e076mr43465961fa.7.1739984901701; 
 Wed, 19 Feb 2025 09:08:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309216aa863sm19127271fa.98.2025.02.19.09.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 09:08:21 -0800 (PST)
Date: Wed, 19 Feb 2025 19:08:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add
 SM8750
Message-ID: <h2shpen65r7v4in54avsez7qtlwojbt2cthyomqrsgs5ewprwb@bn53suqrzkac>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
 <aqpuik4zitdfuk4pahn4wyzxdvxldy4dcqjs3mhr6fqtxpoxhf@ssfzzbfce2nu>
 <2dfe466c-ad94-4683-a2e9-a49e77a61f4f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dfe466c-ad94-4683-a2e9-a49e77a61f4f@linaro.org>
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

On Wed, Feb 19, 2025 at 06:02:20PM +0100, Krzysztof Kozlowski wrote:
> On 17/02/2025 19:58, Dmitry Baryshkov wrote:
> > On Mon, Feb 17, 2025 at 05:41:26PM +0100, Krzysztof Kozlowski wrote:
> >> Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
> >> fully compatible with earlier SM8650 variant.
> > 
> > As that became a question for QCS8300, does SM8750 also support exactly
> > two MST streams?
> 
> v1.5 of DP (starting from SA8775p , then SM8650 and SM8750) support 4x
> MST for DPTX0 and 2x MST for DPTX1.
> 
> The DP in SM8650 and SM8750 are identical, according to datasheet (v1.5.1).

Hmm. This also means that QCS8300 is compatible with SM8650. I'll let
Abhinav comment here.

-- 
With best wishes
Dmitry
