Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D4AAD9018
	for <lists+freedreno@lfdr.de>; Fri, 13 Jun 2025 16:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D61D10E2C0;
	Fri, 13 Jun 2025 14:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dMaae7yz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A8810E9EA
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 14:51:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a528243636so1413522f8f.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 07:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749826259; x=1750431059; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXGpMxHygcfzTELJGLmTF9Qa1p/d89Zbk7jdPDFTfug=;
 b=dMaae7yzlP35F7yqTsBiU/sjdNYW1yZ+gFs6iwJEC9Eal6LkmtPKkNn94be5vKMRxx
 QHVhHoRFUNdGRa/oBQWgbQcEKc3vIV+LtY09irZecpbffgAqo5atAaWJWOVScNMZR45r
 R9izTcepMc5ayaQX4RO8a827X3w+/QukQlNtF/ujls9akU3aB8iS2mQevjY8WN1WFA5t
 yhKy/0BzNL88G3uXZHw1vLat7Ow5lvFAEi0i1e7bN1Q91n1kALs5eYYxi2SFr4KExc8D
 6lDmI7u8Wel2xQpU64oytrLYtSCfeqB+PsiSrViay6PouCPcg+F5BXFHHp6kdofrBj8e
 2BQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749826259; x=1750431059;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WXGpMxHygcfzTELJGLmTF9Qa1p/d89Zbk7jdPDFTfug=;
 b=tVIcjmMyx/t/GWGu2Y+Zvf+WthtAKOmSA6sNNUqlHvtO+bXRx7SzRiOE+yRQ/Y81C1
 g8SWJP1t9+vdtKczIStzd9Pr49OHw/dlEM2vdrf0K0BEqVLD5VpkEOQddd3Krf8PNNyR
 UTNTNxFGpdzYRpJFD1UrJf3TVEjJ5fpPCydiRFKmqrHfn0pJduLzUE/dyzGK70SLkJLd
 6h3AfGmXj1klNKhDd4aa67yMhix/OZZqWbiQmBIOBz4Ns78W0PnR7RFWhYEvXJyKmNBt
 q6yoD4K4BJSTsfTZyPROqhxn4J8Wglye1o+zXHGYCeoxi4bjfGrN8M5S33aVMBg4kO3R
 p01w==
X-Gm-Message-State: AOJu0YxK2zlinzrC4djZlNeuH7JXOQm7qPdqg3AigDPUrpC7C0j7HSEb
 fhrTgUp0BQiDzu546XOctvhKJTQoLuAWrAvgs0Olt1zgnCzJHAPKL97+F6N9C+YSWts=
X-Gm-Gg: ASbGnctrT2/agKFPT3U5N5ROguf2k9dz1SYPD2mUO1sxJnzKaN7uhdWQKgdzBV/ZZH9
 xvcKtqhAwtiKTg6+RhZ1K9VJ7P3KXj2k2qFg2bmNTYkyW0QrqfO5EYpiw7bgSCltz7HJK7iJ0id
 XnOx9DaSv5rCCcWYJwia71txn0JHmDC4g0I28I580f3jvaysBUEkC1eO9RIE3nK7bC5o1tmV+yu
 ZV1aMGmTEWvShqr1Pv8NzHkCuSUa6A9ucZIQBDDx694xFUFbznO6HAsR1QphD4/Rz3bOvIqRKq5
 GIRk/KZpN/HStqqOb0uS8VfEE0tPVFKqhqQgAPjTl66w+wVlMz7ziKei+mT8IXYwre08lo9umA+
 Vp8I=
X-Google-Smtp-Source: AGHT+IGJ34DzRWm1T2gZxcoEWSQEcbIW5w0AwTNiA/GS5kJjbzV7TTazO9AA/zJ8635JEJWkBn/LUw==
X-Received: by 2002:a05:6000:2893:b0:3a5:2fe2:c9e1 with SMTP id
 ffacd0b85a97d-3a56876abe1mr3243520f8f.30.1749826258845; 
 Fri, 13 Jun 2025 07:50:58 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a54d1fsm2562363f8f.2.2025.06.13.07.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 07:50:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 15:50:57 +0100
Message-Id: <DALHN1EOXETI.3BLGEY3KMN4HD@linaro.org>
Cc: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Sean Paul"
 <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
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

On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> We want to WARN_ON() if info is NULL.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bin=
d")
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

You forgot Reported-by tag.

Reported-by: Alexey Klimov <alexey.klimov@linaro.org>

Was the series where it is applied already merged?

[..]

Thanks,
Alexey
