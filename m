Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF76C6710B7
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF2D10E645;
	Wed, 18 Jan 2023 02:06:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD4E10E638
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u19so79775967ejm.8
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJFVta3hfZRXKx31flRwp+6NT2ffWbzRaGmZqjFNr1c=;
 b=iYjiINA+JJ3kTzl1Gteh2w+mbXYZ9cG0fXexodYl+c+HMeAU3ijvCw2l/9A6UII/+W
 zk/r1pm7o/XrXklag/NO61lvSN+4jx5Vrk5yezpWjXvO7SWMRQfS8lM6BocW8giJG4sD
 JfPwWiVAtgoWl8NDfz4a+injNOjlx7/FRmOZUCJ4wJKLZQEAdUMs3n0OYMBPJ7PdcM/h
 NFQOIdvPFVszk9XlGUGxuK9Z4avY+cstBvIGRKohtA9lVmLIhnOyu45FJ5AssCqcxNDx
 FNYTjpSWV5OnvSgUnk56GRe4BQNmpyjtlyndTYZF1QER+2ljc3YFdpbq6dH4Wm88OdQ2
 dRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJFVta3hfZRXKx31flRwp+6NT2ffWbzRaGmZqjFNr1c=;
 b=LYKbGVnrgGCE3T5LmNc6TLbGnqYcDNzRfafLb6T5Asap4SR3m22NOtnvYy2w9Cq8gG
 AhB3qBqm5Ke+hQZyjamPTmbvU+wFG+F6Udol6OxnAj3dFccb4LSczzplBQAMw6etjlu6
 Qdt7yi9fLOKPPdL/U3Sas3GjMBWnbhOdHMYaWzDlyCcCkBdsYRxa5N3ll6X36YrcVHUu
 GnUhYBbJceE1r/VfrHQJgSII9u7P9nEII7N9pTk02MPvgYD1Rx8E/p2tYBMKkICC1BC2
 hWYHZeDFLaNVAa/5YmQbxV2YCBAK5UUQk+8l/oHoCyuDgd9bF4IP/u6mwpaFbgMnzKxd
 3XcQ==
X-Gm-Message-State: AFqh2kpvKc7XQ1mkA91IdCwhxY481PK/dHQ/b2H35wF4eoLeq3x3ggNZ
 KAFEmmG4Rz0Ee2sekSgxEa/RRg==
X-Google-Smtp-Source: AMrXdXuMQsMdEybEvR86mCX/ybN1G/aZe55D3EdZwtkengkxeDuDvAfBx5UmZHdzFoQbX3i4PvV+WA==
X-Received: by 2002:a17:907:9b06:b0:872:f259:a7ea with SMTP id
 kn6-20020a1709079b0600b00872f259a7eamr4989597ejc.53.1674007592812; 
 Tue, 17 Jan 2023 18:06:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dianders@chromium.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Date: Wed, 18 Jan 2023 04:06:14 +0200
Message-Id: <167400670539.1683873.12609021672778272128.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
References: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: Drop the redundant fail
 label
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
Cc: marex@denx.de, vkoul@kernel.org, sean@poorly.run, vladimir.lypak@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 11 Jan 2023 09:10:06 +0800, Jiasheng Jiang wrote:
> Drop the redundant fail label and change the "goto fail" into "return ret"
> since they are the same.
> 
> 

Applied, thanks!

[1/1] drm/msm/dsi: Drop the redundant fail label
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dc57f09acc34

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
