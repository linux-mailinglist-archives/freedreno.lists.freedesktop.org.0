Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADD29FC25D
	for <lists+freedreno@lfdr.de>; Tue, 24 Dec 2024 21:42:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C7A10E4B0;
	Tue, 24 Dec 2024 20:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sn2EKCFD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315B510E4B0
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 20:42:22 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30229d5b22fso61870741fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 12:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735072880; x=1735677680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eSmx/3z/9KsMFggKELsYft98BetV5zNV0d+x+8R4lkg=;
 b=Sn2EKCFDFWT7D3uOLNN2HJKlWBqn+HOWtgpr9vj+eao3t6onRiyFXatYDg8at4GsGX
 epoitk8vQ6VEgsz6zSzWjVlCdpCLZ9Gj5K95g/+0ANLoa5ab2c1Ar2zGMjXDOPbcoabt
 T3H0qWtaPQ2F6GoDeLyU3SFb/xJHcjjKV/zC3T38p7EujLv8fLH1f8PZGHVeUdvUBWv2
 pDqIOboeWyVhK4yTuyWKx+n2n5N1tiP1nWIVTT8oG/HZ4qcqSgJuMrmyvV/ySRVZqnea
 IBrSSv9ejscsOKbE5dqe47PeY+Lu2phBa4syYF01RCOTnNa5iq8/CWw+D4YKB8laFt/z
 e0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735072880; x=1735677680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eSmx/3z/9KsMFggKELsYft98BetV5zNV0d+x+8R4lkg=;
 b=MQiyv37FhrNGcJvteBmFqlPQBhybfDcKZ+w3GVSdCkRlI7i6a8RRrE4M41Ewn3ttur
 J+awfeamN+xD/u+PaW/zmkPslZiJXERYNuAgTLLJxAjKpVFBKcXCW87rPUp23qNJgb17
 WPDZKdvi+nJtzpIHzToTaHgOdK6kZlmNMsEBQc4l6QAxn0WGqH10LaCPDcDjTwApIG3j
 bCz7BQg4fYBXyrpBin3wjKko0hQidDfbJ0Tn8+16mbLNnK/qv9B0HkecfHyq1g0tpL17
 emJNR3cauQ/Bn8bu2KDkDXwNEdAwMglGFrNa2uPtLV8EbkSm0hwe2D1+JGhOPe/Xma/F
 6xvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTuypsXoMmZ16zYDp6ZvVb9sMUJAzBfJJ9t7vh+Y7Fb02qnPRy8dABOIWLs/qX19gRg4InFQ0CbwA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEKSFhJdxc5xW15Qgwt5UF05KD5pKkwaHrI+GTm8cQVVgvd1iP
 ZcAfTWm4uKiK9lYWn8EWwpR0Idu8s7gIiTHudHohjIeumphvq6by8Kd5DfKs1jY7XdnZsvfObpO
 r
X-Gm-Gg: ASbGncvUw6y/ArPdI0zxsDSt5gKvfxQpLQmgBueyQ5oXA5aAtBKHy3MAJ8/ojc55L1a
 q4oc9Z813n8v9TFepykCqTCMyNQ7bW4/qYSCC2ob1QKFmIf6XhqjC9lIyTkfKesUUfOguqCJDpR
 ux2J4N+gfncP1+1+AcD9vy5+krx7JpMagtuNoop12aR9bls2hZmuhkpFAfZITItwKKJu2Pf/YSW
 ewBnizw77UIqH95Sk0gGW49/n1H5bAd9LY0hFcOWxKFsqeZJBh7dYLUYC+ROkwX+1jiTEks
X-Google-Smtp-Source: AGHT+IGnBXUn8XrDRSk7MSHo/mbak7ZljAWLgb4oZ/IVbfIPiilmBmfXljpSRu+9hSl/CaBSMljYuQ==
X-Received: by 2002:a2e:a6a1:0:b0:300:1e0e:48db with SMTP id
 38308e7fff4ca-304685722b5mr45998001fa.24.1735072880580; 
 Tue, 24 Dec 2024 12:41:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 12:41:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
Date: Tue, 24 Dec 2024 22:41:04 +0200
Message-Id: <173507275849.561903.11265213822765879155.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 04 Nov 2024 17:07:38 +0800, Sui Jingfeng wrote:
> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe
> procedure of the specific platform IOMMU driver is not finished yet. It
> can also return other error code for various reasons.
> 
> Stop pretending that it will always suceess, quit if it fail.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Check return value of of_dma_configure()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b34a7401ffae

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
