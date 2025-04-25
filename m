Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0EBA9BEEF
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 08:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8463B10E891;
	Fri, 25 Apr 2025 06:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CV13b6jH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C6310E04F
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 06:53:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ac29fd22163so272035066b.3
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 23:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745563991; x=1746168791; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KO65CEx+RcYydFr/CzyZwwMVrrbrsdRqExGbOK/+azg=;
 b=CV13b6jHTo+sJjo8SC/Ush3m36tdTdjLLDeZJiFg49CbdJTVA7PNUtEbdFbLeeK+Ce
 MBnx7OgzgxZv/Pe7fp8SpfNqJPqPBGbVxlpIp+VgQnc2vhsTStCw64AdZwuW5M1hK3+p
 GuggHvzFf/EHeaf0e8TNAQO+H6aqr3NO8Zo90x+GFaglLXmBWsiCQpl7HsFJNIaZHHcI
 sYZvySehg/I+/+2pYH75PczrY4DOYrHjsUHTVbMpX+x8dlXv95H3ZD8BhW3wPxp1HteE
 OywRBGFiXGPkUeFkOFia75q2IJnEdwJgaWFyCUw71ir0gXI020qFmp1G1eM1LNTQBS0+
 vBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745563991; x=1746168791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KO65CEx+RcYydFr/CzyZwwMVrrbrsdRqExGbOK/+azg=;
 b=w1n3zPE6wv9++nQY5NdV4Zmrqw4i63cyj7Dlhxj7FAVwnJHa3dy40SKmXI7FQ0OdnB
 MHg+Yj837ECUG4YrrFafE8ILsYDtZbpVGJLTzUyL3WAiAx2oth+ZpRTcgVK15sSfbWzw
 XLAV3d2CLdQmY02rCpK5JzP6kXibjhrP4+SkCT7PPfa72dQfCEp+/Pq5Tzopw1ssNqKd
 tISftzsL1sF+IS99ocL2ZfoG9I6BQ45fYV7f3N33p8AiFxXBM8kFLDwGRj8Zwqkd3NWK
 MPA2WnSxap6QCGNYUoyAuq8Xl95aaoiZhziwfN36breypHYEu2Y4+zyhPIxphoNZV+ER
 wWWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjfeXa805ZDBuCSe1FvBJ6cfsiS3xZxBr4A1qg3Pyy8U0bFz8DETJncuSrYb8YFJrT0Kdih15TDdg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWi3MqH4aVNLparZk38jIuyyDmX7My0WYIYOrqUn9bAKmjUpri
 +8l45tXH+lE11uNucodoggI+eRoAN5/GW70LUAn8niLEUHuC12DblVkjX/YBrUE=
X-Gm-Gg: ASbGncsRuS41xS25SzMaLJMcKp2V8ryDVBS5ymWCPIl3vPL0j6dullMB6tDUcqzB3sk
 S69pJD7nwGlRkCvOWSCvBHIn+J515wVIXgdfIuUJF/5L4TQbbqW8hdJpwWSY5tmLUagKFF+HF21
 MdZhNjmcfNeemxcTlQNU+0KuwFY5Tl7R06MT9BL9BVYMSdQ7fHoBmpN6aLSbRGMmM7NMUapegB/
 NcEMTzgIByWV25qvgv7akTk0qvKzkRxERkGq3Qqyp1EkwIwPD2zY7ZHnrFR+Qec4N8kOEIu1aPB
 R42zTPT6sduPoHocpRlBpH5UowRnfoy5hY8xzg==
X-Google-Smtp-Source: AGHT+IG58VzDkGFhm8Z0pviWxJ++MDZSR0fg5sx14OLcY5mVRrQMI1meGNjl2MrGAtIugid/tRuBDQ==
X-Received: by 2002:a17:907:9485:b0:ac7:75ce:c91d with SMTP id
 a640c23a62f3a-ace7108ac55mr108123666b.15.1745563990935; 
 Thu, 24 Apr 2025 23:53:10 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edb1ac8sm82529766b.182.2025.04.24.23.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 23:53:10 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:53:08 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, johan@kernel.org
Subject: Re: [PATCH v3 3/4] drm/msm/dp: Prepare for link training per-segment
 for LTTPRs
Message-ID: <aAsxVGtW+yNlFd5P@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-4-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-4-alex.vinarskis@gmail.com>
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

On 25-04-17 04:10:34, Aleksandrs Vinarskis wrote:
> Per-segment link training requires knowing the number of LTTPRs
> (if any) present. Store the count during LTTPRs' initialization.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
