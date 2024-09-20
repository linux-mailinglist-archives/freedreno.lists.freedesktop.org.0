Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6264E97D83D
	for <lists+freedreno@lfdr.de>; Fri, 20 Sep 2024 18:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1DD10E852;
	Fri, 20 Sep 2024 16:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LSIZNgMG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575F710E846
 for <freedreno@lists.freedesktop.org>; Fri, 20 Sep 2024 16:21:23 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-536584f6c84so3029150e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 20 Sep 2024 09:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726849281; x=1727454081; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2n+484yaUAM7Bqur487+xLmG9zEd0hBev6NunxbKIeA=;
 b=LSIZNgMGhwy/OQU/UY+pZppovcDXNNbvWuwH7VKhRzS3xWsbBni9QENt9qxOjRlBFh
 2wbh3eWzO++7x+2Ab1NQHex76qkgmUmC0D+u93TWAzQgX3mGZIv3hrFKD/vlSSzbF9kx
 Ij6XrpyNti3QUmW7DF6N7NTiUlqkCEMSZxkfS00ruyi+6GDZ5GcLyHmq0HyZdgPHJQsD
 B6Bksm1gKN4qTesy9wD82GtZ4PZ74jiGYg3MFhTNRYim02t3lWVCbrDrxwGrCqLi3fjQ
 qNTYHbWeZ0KVaB5n6e15k6qM5eXNflZmjczAshEJhSJPi1eEQ9BN7I3c+2FW541kLQoP
 zCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726849281; x=1727454081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2n+484yaUAM7Bqur487+xLmG9zEd0hBev6NunxbKIeA=;
 b=Dq/Xmz2ambJ+zDSbo3vvMxdV9oD/7mfJIXC7St/Uunx7GmP8nL/yeG6eYlvgeEJJTb
 mKfRrz2f8AbzX3zvpMp+4xLj3YdBZvB8NW1fQnGVunLd+eZKslxWGyEe22GKXhoqhW9+
 U5IvDfvMwgMC/YbxzQtt5iJbp6SDcjWgcbe1etAgvEe9TQxARurTE+rS1ddZs0IarXPF
 nkW37Pxr6jKuJtZnWP6FcQhfASAfzm0ppiet/4lBBxi9alDTin7nB7IG7as+ZpXCAIPV
 NrPyxGLQbQ+F/YSIN7RJxTKuAfhweEDhciK87WIYDiOoWkZpYmqSNKWllRnCpvMpJRkV
 L3Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaP6fwIWPchGuvs0i9fQ3r56+vC0jKzeabBCvJ1RzRr5/ZgpystVHRZnxvcWStY2j7pRCSyxn9cNk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywsgom3tlJBI/TjQ5P2hnko7Yq+SC3EBboonGY1Pa6LzCGY0Qr1
 mJsDrzJ7HbPR8Ux0aO8rS+lRG9VliA1puIeqBgbfEFAkpBauoQMw5TAXNTcXZ2s=
X-Google-Smtp-Source: AGHT+IG7LsDitpApvLyICxw9texFBC0bExcUWUKBd3AdgrIkrscJOpeviiSnfe3TSFgFifCYaGCNeQ==
X-Received: by 2002:a05:6512:3b29:b0:536:55ae:7458 with SMTP id
 2adb3069b0e04-536ac32e514mr2367040e87.40.1726849281394; 
 Fri, 20 Sep 2024 09:21:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368704ddb2sm2236913e87.104.2024.09.20.09.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 09:21:19 -0700 (PDT)
Date: Fri, 20 Sep 2024 19:21:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: quic_abhinavk@quicinc.com, robdclark@gmail.com, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next v2] drm/msm: Remove unneeded semicolon
Message-ID: <qmjo32urtf4ftcjggyr3z4dr2alwiiw5si52lwvwz5vxpr22bf@bkrnk6oafagz>
References: <20240918023357.59399-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918023357.59399-1-yang.lee@linux.alibaba.com>
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

On Wed, Sep 18, 2024 at 10:33:57AM GMT, Yang Li wrote:
> ./drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c:282:2-3: Unneeded semicolon
> 
> This patch removes an unneeded semicolon after a switch statement in the 
> pll_get_post_div function. Adding a semicolon after a switch statement is 
> unnecessary and can lead to confusion in the code structure.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9852
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
