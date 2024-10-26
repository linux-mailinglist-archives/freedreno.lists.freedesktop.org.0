Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB49B1A38
	for <lists+freedreno@lfdr.de>; Sat, 26 Oct 2024 19:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98B210E421;
	Sat, 26 Oct 2024 17:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FK+DFC8O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB7510E421
 for <freedreno@lists.freedesktop.org>; Sat, 26 Oct 2024 17:59:50 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb5740a03bso30884751fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 26 Oct 2024 10:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729965588; x=1730570388; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A0rpcITzgiWTu4jB+jeHdfUnSvR4lI0mkdI52nstT7Y=;
 b=FK+DFC8O5Pg6lmSH7eTQBZYxRIxtWuzwDbqObRb5dDQEDtFJ2B6tqh8ZmlDE5bMI4t
 8IlNgNLnJ0XuxsANmFgWEq51w0MFu8Uwe7rMyeKMrCj838AaTUYTlofBFfYFsnKTo+KD
 L0dTe5Vv38lKArpseO+HpPWwm5Nl7gc1tr3C673GGrdG7txk4woIWXL4q9e2+1CCJaj2
 OViq+cv2qd3EItSuSgTAWcjJ2WbSmq3dGmycEQjdgpQkKxpDhxrgLz3Imw/1mRY2kyTK
 8qmkikMBGTUDNHLNX3s//VDO3/wymc+t804Wv+zVphRLG+LrLmqQZ8SOmFbgCHuAB2KJ
 ETXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729965588; x=1730570388;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A0rpcITzgiWTu4jB+jeHdfUnSvR4lI0mkdI52nstT7Y=;
 b=jM8BUXiBFQ4prrWdjE3GbTEJ0WqFF4m1s5OOCwqjckWEdmrGM5bSb2B7w3WE7ra9Uq
 0u4dqwy5bPylNC+vab2riGjC86aoRZfL+ykX4qX0CAJrPDCdbZPLmjIsYThEKU+O+khb
 zPP8dJCi/ZQ1ODNvBSZd4cCht0sr1CiU6N1cM8POpiWjzn8PcREwd7sgfchd6oTHNvGd
 j2AAnYpMOzxGpH5YfyRM3IlbRu6lXQ9kkDJ/CrauuKPNn5J/uTZZ0bpSEI5d2bXizxaO
 NHpZDmxTzxipg8APSzO+9ie9aBVSoJY0Az9HVzmOoj2NfxQDOTmD2hVbC7+qBX6Izao/
 fk7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/pYGU+sSSISJG5WPCPDoibRIOjO7HUr0cVsG4T2bkyhCXGbYQsk4msLAubEUSACZjIfwymHqvb4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxnb2ThgJ+g3myr2XFac9PsnpAtGWIKY3CH5GKxsYWNdtIpv4Xd
 NjNRFbfwUs36S2ujWb0leuDCkoAb7JQAzHaZd2XIrxpOKTXc+M1qMPPNYt/alX4=
X-Google-Smtp-Source: AGHT+IFRMrOOLLIA+sh+NSisfOX2pnRQbMz984wwGsrv1109P913+keDI0gBdVrjlCnKdAQ7KiMRqw==
X-Received: by 2002:a05:651c:b2c:b0:2fb:90bc:1b3b with SMTP id
 38308e7fff4ca-2fcbe050933mr12208331fa.28.1729965588159; 
 Sat, 26 Oct 2024 10:59:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb453e53esm5970631fa.71.2024.10.26.10.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 10:59:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8[56]50: correct MDSS interconnects
Date: Sat, 26 Oct 2024 20:59:39 +0300
Message-Id: <20241026-fix-sm8x50-mdp-icc-v2-0-fd8ddf755acc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAsuHWcC/22NwQqDMBBEf0X23C2b2Groyf8oHlKz0YVqJCliE
 f+9qdBbj2+YebNB4iic4FZsEHmRJGHKoE8FdIOdekZxmUGTviiiCr2smEazXglHN6N0HarSWO+
 IyZQW8nCOnFuH9N5mHiS9QnwfH4v6pj+d+adbFBLWtfeurNTDOG6eMtkYziH20O77/gHWCSBtt
 QAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 stable@kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FwjYPnwwuuvmREZIJqAfOXUf+GmJj+qv8PyjtmS6sn8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7qsnoBgnV7MvNbdzbnbeS8Xm7AFeBh68jRL/m6NYf8iN
 +PfsdedjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjILAH2/675S2ZY3jV/36lf
 uS2tUS7PV1E3xnt22D3XS/elZRoaoj0+fOaQW+RStudywuNXB50U774viGIW53BYvn6zkoavnFn
 Uo3Xs66ZY6a/q9J5up6/Vt7u0yHeKoLnyhprumneVAXfFbVkWLP1dwP4h5UvDKrbkk3oRAmz6sZ
 wfjVQyq+PDIvcwPJK/LqyV+X7JVuZ05cfhUn/P5+iplDndiCw6clp0qmiBbOsWxm8brINYlnFER
 BS92Ocn9uHtoxt1lfGd3x0232g5nOeWIBt6R9nYsk2h9pTxC71lMsXOV0/HLzV4qCAZWhez69jB
 j0sYE7e/PtP+TLXccxvDhJnb8gsvLzjaw6j4OavTiR0A
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Both SM8550 and SM8650 misuse mdp1-mem interconnect path for the
LLCC->EBI path, while it should only be used for the MDP->EBI paths.

This kind of misuse can result in bandwidth underflows, possibly
degrading picture quality as the required memory bandwidth is divided
between all mdpN-mem paths (and LLCC-EBI should not be a part of such
division).

Drop mdp1-mem paths and use MDP-EBI path directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed type in 'degrading' in the commit messages (Konrad)
- Link to v1: https://lore.kernel.org/r/20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org

---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8550: correct MDSS interconnects
      arm64: dts: qcom: sm8650: correct MDSS interconnects

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 ++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +----
 2 files changed, 3 insertions(+), 7 deletions(-)
---
base-commit: 7f773fd61baa9b136faa5c4e6555aa64c758d07c
change-id: 20241006-fix-sm8x50-mdp-icc-138afd0e083a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

