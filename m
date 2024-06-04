Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D438A8FB636
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 16:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8443210E088;
	Tue,  4 Jun 2024 14:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zmjrTscn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F24910E088
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 14:54:15 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52b8f5d811aso3754866e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717512853; x=1718117653; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3kFcZiFh6dPe0teLEcLMmB2DrjwR1Zno5n6tFH14Dc4=;
 b=zmjrTscnaXaNq0BIGzI3F2qZHOTpATXxKxB4H53JzDA3jcfsB9Ng7kJhL2kI5zKw2N
 Wpnig5UNmuhSL+cpvaT6od/U2KD5CkGUF8RY/OYPquqLLL8P7kxhIyQTYJKfESKCs+Wy
 CIcgRYSAQd2QcE1Im4nVMt4hKsxFdtNt4B6zOLtLO/KGtLBHdLgYTw1FPh0QpRjxuW/L
 xRCdvS6ZDQacMOeDkn9B18T7kfCtD6Oj4H5tp9PbXm9cLyj+syGtI2/J/4NyrQdiroaE
 O7FfD3orlwQAwYx75w0lilJ5M31hvd7jD4YNVUdkv1E3wYsbn1pJqSnS/q7XA6noRApi
 JmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717512853; x=1718117653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kFcZiFh6dPe0teLEcLMmB2DrjwR1Zno5n6tFH14Dc4=;
 b=d05vrPcnsa4luX18HMNx/RQRb0Ka5+mYIJEnVG5RfPY06nqdDDOssycF6NOyiWbroB
 A6m6doVHVzw4JFQP+e9U+JeRg+DHWTUsO6tDygkEuwNiyoalId+QyBhpwBnpvJw0S0OU
 Zv+5bL5nkzUXMSu/B3BdcChmuN4jBsxGIz66SrNADBmwcrXv6uxm5wnaEwXNKgCqHnfw
 1YCqizfaQNPOiTS32H4yEIUBqf54TH32vrvppYPQntr2IvW3u+aJbli0VzKw7MSiwghU
 48QKlSI3MHPDxi4fd3SkmrtflDbWdXkfZQBE8igDzPH6P4AMcSL+t3F7O6mSRPUSymI8
 Fusg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBjr9ItvBRYTCX/QOwcH5h7vNCL0aLTfafm9PcYjx5DoQNE7q32vQrMq6niWvD972beiCaT0rTJMwhUUbrqmX8ZhiuK4COM6JgTsgCmenk
X-Gm-Message-State: AOJu0YwwpB8VT6pWbOFnJ44J4U7OZWvDsJVew8Pf10pdiMF+KY0gGVr+
 AFlYs8oqXRvtCPrigUoSdMcWwBWjEIqGzoX9AeG1otAPHyKwvJv/eT7+tV01Mn0=
X-Google-Smtp-Source: AGHT+IEMq1rr/ugARK9g3nwNNTXFstD3YYYsBSNyVfseCN8M1WXYslJ1wb22dmS230eDZttRhDkvZQ==
X-Received: by 2002:ac2:5288:0:b0:529:b734:ebc9 with SMTP id
 2adb3069b0e04-52b89590ce9mr7000266e87.38.1717512852962; 
 Tue, 04 Jun 2024 07:54:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b9cf956d8sm482251e87.61.2024.06.04.07.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 07:54:12 -0700 (PDT)
Date: Tue, 4 Jun 2024 17:54:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 freedreno@lists.freedesktop.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: msm8998: add HDMI GPIOs
Message-ID: <qrpksyuwapmijphajrf64ogl2lgc3gbgm6z27nnd2cetjxdddq@az2vfprdz4yu>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
 <84a86082-f28d-4750-a4ab-1c534bc54b78@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84a86082-f28d-4750-a4ab-1c534bc54b78@freebox.fr>
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

On Tue, Jun 04, 2024 at 03:47:57PM +0200, Marc Gonzalez wrote:
> MSM8998 GPIO pin controller reference design defines:
> 
> - CEC: pin 31
> - DDC: pin 32,33
> - HPD: pin 34
> 
> Downstream vendor code for reference:
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi#L2324-2400
> 
> mdss_hdmi_{cec,ddc,hpd}_{active,suspend}
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
