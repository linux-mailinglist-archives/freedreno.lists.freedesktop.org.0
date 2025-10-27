Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8FEC0EC82
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 16:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA9510E4CB;
	Mon, 27 Oct 2025 15:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LKp5e1B4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECBE10E4CF
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 15:03:47 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so28834625e9.2
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577426; x=1762182226; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UKpkOIXxwDv4N6ETMPC6x38UtxY2L9u2nMKcGEac270=;
 b=LKp5e1B4QnE6mOvgbb7iJXZ3QfqIrWGIUIwU7Q+JXx4hXT0lvXnFatGjkFE55bmE03
 +KgxfwPw/49/xJfC+4WnfAutWVo0sI0absF3Y6F9PwaGnmIyWE9WYsUzIiZDdSv/TTkg
 T21FzzqJmD6mNB/TAPwyxa5O/haT/R5Gd/RVh1Q7tMv/5942TIrf9Dhx9TEiJgfMSvx4
 nu7wOScj1Nk4wfUmJZJPqz3WNTgiqXrdqMVl6L7yF3TiI2AJRpJIZQxaLEMiOtj659il
 C2hr//Evxi11szPm6reGuApXOTvU/qw840f3Flfuo8Y6+iY8LPRmmi0ub1IqWhxhXoWu
 ucYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577426; x=1762182226;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKpkOIXxwDv4N6ETMPC6x38UtxY2L9u2nMKcGEac270=;
 b=qkXXnqtJlVJia0ck+P0iuxom9KnPuFa2yIolnmoy4Muj99tvtTgf/jGHOJwBYP5xAQ
 U0+dlhBC2uGl7FyZeCRYAJe4GQnplW9xfStqlYYBKpthcZn7tQSdRYMcxOkfMlCA6DLD
 lEQ8qhlKWB6lR+5fV9NvUhQWJbQB7et4nlnDJu3p5CKOnoro+OgxPcJJjgh1OLJP6fep
 r/c76JK3vVl8dD7CY/1tQyTHYlqBje4rcW7LmH90amkYGxpK+iVwc4Nev32XZ/Ed+94B
 j2owd++RIpX8RJK0uyVQN602X8JEm4rLfdLqq6Z1ODjjiI6XqyTPdGFsmZ1gTy9gPhWb
 1pXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF/PD9UHsuBqQLB99cLYXUya+EBFX3EKp/0y2L8/B4+U2OymW50T19WzRoBrOICv+/oVRmDMaONMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAbfC6c9lBGH/WEyTl25E/5b9cusslxFC10NRC0zW3z4BTN9ll
 8v0t5cXKwL+wPk5OzUtRK6EQOQEVgBYMyY/0i4InoNXq4RPVG3O+IUZBFGczQBT0Xao=
X-Gm-Gg: ASbGncv7fcQFC2tE+P6PmzCNaPuXDIZsvU0gWh9VYqbclvVV+ixa8WdAe34RTXdWkYq
 2LRaQ6e3cuilO10ofCXlpYMIPXfeCwu1uZ2PDxMkGYQ6uMDFV3lyo7/KrwamVMo8D9s4CTcwn76
 okBkImiE607DTAr/XA7TFrS3zjhpXFXXG0U7PJFDKzqM3sf9Dq0PI11TLoFZYDXiEma7BC58k89
 iEOGarUCUJFII2wvdmxCPQknqKZbwbmJ91kA8uxfyyEahfOeZuMqAvr0BcdUWt5JvLxysNkmaTf
 sS7OZeBLUtDKGkijnhaJMezhcnLQMlq0XHDj+T4VOXpZGWTKT6UzYu2tL+Z2Op05mxnESwF9ERI
 O92SJn4oUXtJL0poSBFUuRVJSFs3KVa0XsxufVjSXMuki8e/GWmyJw2d3viTscAYULtH0Nd8Z
X-Google-Smtp-Source: AGHT+IGdgZKKc8tkom/y4GwEbztmjQrk8NHF1ywqGi+zVO4NSb3Xu2bsylUy9DS3LDmgv6YYp+masg==
X-Received: by 2002:a05:600c:1da7:b0:46e:4be1:a423 with SMTP id
 5b1f17b1804b1-4711786d630mr260978135e9.1.1761577425808; 
 Mon, 27 Oct 2025 08:03:45 -0700 (PDT)
Received: from linaro.org ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475ddccaaf5sm68399545e9.3.2025.10.27.08.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:03:45 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:03:43 +0200
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
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <vngf7cnsj36ddg4pdm72airm2nketxk3m34qw6f65ompimpcfl@r3lbv73tmutj>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-7-ff935e2f88c5@linaro.org>
 <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dxq62ltoeerb4g2fgchb2hd7eomvlexfgyvamxsuuirblavtn@4bg3dy2bukdq>
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

On 25-10-27 14:29:01, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 03:38:32PM +0300, Abel Vesa wrote:
> > Describe the Universal Bandwidth Compression (UBWC) configuration
> > for the new Glymur platform.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> 
> Bjorn, do you indent to pick up this patch on your own or would you ack
> merging it through the drm/msm tree?
> 

Please note that v3 is out:
https://lore.kernel.org/r/20251027-glymur-display-v3-0-aa13055818ac@linaro.org
