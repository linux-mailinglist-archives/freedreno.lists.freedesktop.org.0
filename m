Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C28A37FB4
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 11:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C9D10E40A;
	Mon, 17 Feb 2025 10:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xsmuea3A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2853010E407
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 10:17:46 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so2665036f8f.0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739787465; x=1740392265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjnizhfij0DxrLOw16h1FTCOX0FfuFrLDYVy7emG8Tk=;
 b=Xsmuea3As6aZ+Y6TSZZ6vKgn0KJct8ddD4a5SgPOeu/y9IY1TToif3Fx0pMmzbfRct
 2dZUWTjZvnJp9j4zpqdLjKKylVv/uGsvpp+Ri8o7/+Ddi37WtRs59Q8EapbWZ6tSBCvB
 2/mWk1xXgyEHKY34/NHsCnNeUrdDhvjb9MRXjguaOQFK3c7ST2wQStba3YS9RCY+eVYZ
 l8oOTWckxsbOk1fcVuOpluemPKCK8KRckzZDGDOaGT/k5MJC+U510aL5KQ5v9bifGfpH
 CcT5t2mQP8O+w7UyjZ9ZYbj7B0DOtWA4mhTVqX8xsSdAZ5FB+MBFahVk0YgfSFvsjQDa
 K/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739787465; x=1740392265;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjnizhfij0DxrLOw16h1FTCOX0FfuFrLDYVy7emG8Tk=;
 b=BJxQ3XzvNLey1JYSGHCjGnF/KRcyMZ+iSnNcHp3uyGIcbNzatUcaFUmwZKBFZJzLJg
 XgGqQb/aaOEDceDN8FLNpt0L/KZJJT2ePV/0DRAUstULZeGoKy3CWhfdyRXy786F7jAQ
 uKiLh4jeBusO5gK3IbP9TFw3t/E9Qjet8AgoIyXJgTjBFwCCGudB85+ubMQ7qvzfp19v
 O4yJncGXZdua0gsAruZ17Hgb1dZjO9XPbSn7P5DmCq1bLINO1sjN0/PBYRomsW78s/tz
 Td7utpJJbsj+JlaWNVl9x9OYX0E9hiz9Q/epGsUBDIib6LPMe3Q871vjm6URCq+uD2Sl
 YAeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWgncBFHM8yACsIPQg5f8rNESojHtrxWUNSYLjijmH92aEpF/lRZHEkPC8DNM4SsFEBA+vbZiX9mE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjUIbkoUdIhkD8ZNKY6ByjoKcBn8rdeBc67fNXaRUVpzWagY6K
 uk0eCuewEfKfQBtm78oklEsDbUjmRCgsIwevpTvrc3P30Bh57BvgabtN3k+K5bM=
X-Gm-Gg: ASbGnctUjbF/s+0zEhBPlYqGON1WGpfivaBMf65xkZzzUx6XJ6Jl3KJvriLRWxFVPZq
 ObzqN3s88B5DUz4SvXmgmpNPfEmI3mClYeB9KN9tmaKFf29rmvfgNQQtVuQlExKoRh6p+FY95Ld
 JOed8AJ6ZQUIV19/DuvunOxkNQ3CMLylkslv93Sd0TAAYSqABwVe8x4chNvl9xXkMIK2VAWG1Zm
 KC4x8M2rtreKk2WmihEg+yFA8Q5z1njzqYw3j/juRpneC6vaFy16R9FO8pFn2xc2QdLnPhusEZw
 KQ6wfMqk2gURFdOh6dKXI5GxPKxEIO6tZg==
X-Google-Smtp-Source: AGHT+IF7XwyAqsyVybUOb+YT3My0TlrSfzZx4U/CaLhTm/XLeIcngPTFZD0Vb4ytwztWX6MVo98cdg==
X-Received: by 2002:a05:6000:402c:b0:38f:3a5d:e62f with SMTP id
 ffacd0b85a97d-38f3a5dea23mr6895087f8f.33.1739787464671; 
 Mon, 17 Feb 2025 02:17:44 -0800 (PST)
Received: from [192.168.68.111] ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dcc50sm12046297f8f.34.2025.02.17.02.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:17:44 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
Subject: Re: (subset) [PATCH RFC 0/4] Support for Adreno X1-85 Speedbin
 along with new OPP levels
Message-Id: <173978746391.27110.17465291668859357570.b4-ty@linaro.org>
Date: Mon, 17 Feb 2025 10:17:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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


On Thu, 09 Jan 2025 04:12:37 +0530, Akhil P Oommen wrote:
> This series adds gpu speedbin support for Adreno X1-85 GPU along with
> additional OPP levels. Because the higher OPPs require GPU ACD feature,
> this series has dependency on the GPU ACD support series [1]. Also,
> there is dependency on dimtry's series which fixes dword alignment in
> nvmem driver [2]. We need a small fix up on top of that and that is
> being discussed there. Hence, the RFC tag.
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: nvmem: qfprom: Add X1E80100 compatible
      commit: 3419bdfd88e314bc5f80b02fa4651c81a0a85b57

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

