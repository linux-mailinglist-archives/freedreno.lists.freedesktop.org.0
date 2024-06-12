Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E478905B80
	for <lists+freedreno@lfdr.de>; Wed, 12 Jun 2024 20:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F77310E8DE;
	Wed, 12 Jun 2024 18:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RPk1GOLp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D7610E8DF
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jun 2024 18:51:48 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so256426e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jun 2024 11:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718218307; x=1718823107; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YFYPQEigFT5TfOCN8eDaCIrl7HC+yeqeYN0ZmGZ+Sr8=;
 b=RPk1GOLp10xshVVQ6qH28fYLpDC97mZDBFtPbVIL3aoRMl14S8+qymDvVvM0Vw4WRp
 WL/6TfcruqbPwDsMApQYQ4wMMq04AEmibVHTyTSBl+tCVjGp0C3+K6rMX8ihT1AxwAMq
 xVutD2O8OZa0TVTicwVY9a8fhrhTjYpmLrczV3YrDkGxtPlCfUKUrNMxtTZt4INmv7+F
 PwVJTnStF3GT8Ry6J53LkLQDWsq8pVQGPTapyx9jpL5oDfCMCYI6dzcbr1BYqheGf9wc
 Qp7cIRmp/VEd24igzLspS9dzuDuTnpHhnh76si99uslRB353lb5366XUxQbRftqu6iWc
 TPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718218307; x=1718823107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFYPQEigFT5TfOCN8eDaCIrl7HC+yeqeYN0ZmGZ+Sr8=;
 b=TLJ1S6zCjPZpdmVYkbUHdLzgZUlnlrnM9jpIKX9zqAC6LKswRQZFGyCp3nUhgT4wGu
 NkKaWII5gum0NNo//aLPyaHv1W79oP/tvwChF49CHqY0/UGGVW6eK87M9/p3IbLc24Fa
 Jw/wYFtHbGs/tBQilefVPaeir0Bi4GJZX9IVk21qq0WN3aahlaOlITVSCf/xnFxkreoc
 I8muVLaulzxZDpZHzwwCrNMV0LDzODJnMjNRqdo2JHL+O5i3OloL0vTErrNDxiLVVjkF
 qb+0Ve6e0FFE3x7m4cFtA2iJuusCivVucyKUdlR0nvacrWmYy2J5Zh9+KOrwSuGsaju2
 0QVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX98vwMhMje5fCpKRP33f2V+TQprvyBjoGcYGv1z1VKe1u56IPu3T4P/csryVIscW6NM9/B5oPOBVxL6szRLRXE6T45swDsEexiVTrN38qg
X-Gm-Message-State: AOJu0YzG96QOEc5VPb1K6xELzTQ76bK8P+iLlsK3D8benNCj9hwdw5g8
 b7ZwIjtcvp5LC+qY29klAczUez5M+yEJZwnW+G6iIHk/nnnTPjsL7gvBuJrdzuA=
X-Google-Smtp-Source: AGHT+IHjX90AGX8knBQHaw6dOK8zsSJKlpbuIZ1J3ZLU/93MWJ/OAchtptQelggFqTZRz8uB2Ye9ZQ==
X-Received: by 2002:ac2:4850:0:b0:52c:8023:aa9 with SMTP id
 2adb3069b0e04-52c9a3dfb4emr1809326e87.36.1718218306834; 
 Wed, 12 Jun 2024 11:51:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c9d2f57a0sm327045e87.284.2024.06.12.11.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 11:51:46 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:51:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_rmccann@quicinc.com, 
 konrad.dybcio@linaro.org, neil.armstrong@linaro.org, jonathan@marek.ca, 
 swboyd@chromium.org, quic_khsieh@quicinc.com, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm: mdss: Add SM7150 support
Message-ID: <grpc4inh7d2wpwrkvssehapa7z7mw4loecjt3p4qcjjefobvco@6g5sll2bkcbv>
References: <20240612184336.11794-1-danila@jiaxyga.com>
 <20240612184336.11794-3-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612184336.11794-3-danila@jiaxyga.com>
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

On Wed, Jun 12, 2024 at 09:43:34PM +0300, Danila Tikhonov wrote:
> Add support for MDSS on SM7150.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
