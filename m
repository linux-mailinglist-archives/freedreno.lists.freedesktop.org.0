Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF0BD91D7
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 13:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC6410E5B2;
	Tue, 14 Oct 2025 11:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p/KryFUe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A804E10E21D
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 11:52:12 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-46e48d6b95fso46024885e9.3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760442731; x=1761047531; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S5kwp6ZoI0Qw9Lio9IILJuSek2MXZc7hvFxHIxIa6Qg=;
 b=p/KryFUeMcYglQCJw0BYhA9jm5vC+BqZxL4EmRRwKUOJTnmXXCadctkFGix5rNQuIy
 UVP6UlbCBoQbcN19fbTk+9foInLQWZ2z3bTb6kHGlaMzDwT9dtOLehh8CMDwCanw6Pni
 4nPcSZChj8cSWjMDPd3EhWLgLN/YkmL3F+p6iybJfhlsLt+4PGG5QNtQUlkdR+bEYr5N
 DGWx9extvX+co/qXToAyKbhHTDq0K2H8jajBWtQEAcfz+/xN6UJdMtP+yTTX2mLjN+SY
 W8cUC66+EwgpljqL9hl6Kz9eZLIqW68KYrQjpkgZy8qqdsrjN8gXykirfkFgsb4Gy+3p
 qtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760442731; x=1761047531;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5kwp6ZoI0Qw9Lio9IILJuSek2MXZc7hvFxHIxIa6Qg=;
 b=P5mPfsrEFxfHhqxm8PRjJWmyS/RU6MI9wOAnO7mt1QdhTfYDfhrcMBEkv+a22bm+FE
 GQStBgYD1rGAKv7li8zex+xw8NBNVAk9+Ig3OU/BxThNoG9L/rYIj7pkpSD/DP6Klg/G
 PCPUfkFDJ5xf5iClbLLouIgF4rh0nZiRurp+qIZEuEoKR5XjzHBbyl/MeonipfcxcCFR
 Z+ZNQ2Ru9qL8pUG21/3V9hL90RnymbDcCmUDX9kLWFJZ9fV6+57EpQU95JcmtBeBu4ts
 DoKQxi1uMevNWnxgAkUmbeiu1mHKib7VzrfFh9ANkEwOFj8lj0vk+UcZ7YgeVEBoydz9
 7y6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzhrC9qfMfAq0jOQRnN1HV/h3eIXD7/5/Rz35O2FrF6AbuZB7y0U5PJyE2zl/sjfbWbHOQNeqEzU0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2sgM9X94QprTkFla/lQvkbLyhPAhNYUfidWUf14cnFZC8m1eF
 xlNveXwPDp2aRUKUvQGfRYoZjDQ6c4IObtTce/6aIHxfZ3ETRQT7UuJSG8gXi8maUxU=
X-Gm-Gg: ASbGncuXvP9I35CPArGbAnZsxQwuZKgHPgmS3YMJ2C1aJZGmAQCHttbigpK5RA3ZhU9
 qZcMTe65ByPK/7wFtPy/0BoZ5MqjheHMn/JolS9VAk6XbOdopgW4VdxpS3v51aWejtpouVOjUj2
 S4SNIOhgXCRzzWgMa6eVZTB7IpAaq0MLZ762on1wmgSl1t0LIR1Sx26qzRajy80YQcxxrAbyvjj
 zdc+jx12wZ+TzL6acNxJi2M7/caOHngBNsR+ps/UY9u7ae92wP0ONV1oG9nFAhYdoSMYU+TkG20
 nDcjF1onhmROjBNFiZDP2kEFryppZ7sOcAb46ytn1qSgkrMlH5olCgUYHPGHnkho46/NVIJWUqU
 2yThHKEMmhbCYuvxiH87qB0fQ9r/JyP9Q0BMcZdOGkmdwc3yretRE
X-Google-Smtp-Source: AGHT+IE0T5cvpE7QhDWujs9OdISYV+M+qLIfcBtU5FuqXOEPjcO1IUVOft+IiRF/W2H0Fcynpk8rfA==
X-Received: by 2002:a05:600c:3b29:b0:46e:7e22:ff6a with SMTP id
 5b1f17b1804b1-46fa9aa1d79mr180603815e9.15.1760442731072; 
 Tue, 14 Oct 2025 04:52:11 -0700 (PDT)
Received: from linaro.org ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489af92sm255991685e9.17.2025.10.14.04.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 04:52:09 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:52:07 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
Message-ID: <mugh42lzc64wfkcacwo3z3pj7o5m3gx2ksjh47q3q6gu5dwqly@vfvs2n3czy6v>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
 <mgbv5zoptfox664jswi3imvibrd7d2teazeuied37dw3ooiex5@lli2bsap7d3x>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mgbv5zoptfox664jswi3imvibrd7d2teazeuied37dw3ooiex5@lli2bsap7d3x>
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

On 25-09-11 16:01:30, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 03:28:50PM +0300, Abel Vesa wrote:
> > Document the DisplayPort controller found in the Qualcomm Glymur SoC.
> > There are 4 controllers and their base addresses and layouts differ,
> > therefore being incompatible with all previous platforms.
> 
> ... and it's a new core revision.
> 
> BTW: any additional clocks or regions for DP?

No new regions and AFAICT no new clocks.

Sorry for the late reply.
