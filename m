Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6422991388A
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 09:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D645510E10D;
	Sun, 23 Jun 2024 07:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SXPPhNWE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4AB10E10D
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:18 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ec5779b423so7398961fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126856; x=1719731656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2ZMLQFo4YvUdIspJItgGUAJ6rugpc8UkvKjlKE6e6U=;
 b=SXPPhNWEIjhi7gmDz5Givj3QyfjP0mjdB1ahaqD2Kl2as0aTaqIZfV9RV9xaL5cZst
 Z0+J6Twvemgc+Yg3zllGBr2beAr+bzkM+AUnb2rr+Z3mtX0T2RyD7xvU2iVw5B0Oat0S
 2P48LIUC0Q6rOy974cR9hOJWVhfID7oAMsl7pf9mSE8ZhoqlH/tHFU4aHjF8/gEX3/9V
 +2Ml99mNWZQVQEWSJKUo4aKRtkfbzU5O0HxLYVWoSwAV3KK+1XeKwQhOfvnti/BcwmRG
 IpPA3YzwBaoc/gGERbH8xZEwO0nf0ETr7MNddeFv2GbNPVFElbwu3loIFrdJ/TqAK2AQ
 e+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126856; x=1719731656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2ZMLQFo4YvUdIspJItgGUAJ6rugpc8UkvKjlKE6e6U=;
 b=pLTYdfU7xII+1CHQytFXTX0flxU/83EJ4S9lDMzLK5UJyfU2B2xL7Sqed8OMPktVHK
 w/Dz6oZuW+deGmCe/x403C5g1MZD4MwQRYW5w1k7eF1UDGl1nUkRIWA9meWHFeDURHV5
 SqZbVqGU7/GrVXYvwIO84CqN+FRXp2hPS/y0UbW4AFPlqg2Jug4BqacyXDn2e0585Fqj
 oG9MadSJeDaNU18o4rVzkA1fZnyFawBwIjWIKv5ZMhx1CaNAm9zdtOyCaBOXYlitRf7p
 /8qC061DOCpOU9Qo464LJjva8FM012oTjQLuWXMMuJZAlzHSp0ZWHOBFCFWREa1pt9GK
 ufWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUm5H3yMSq/m53ExQXPzCDCn/I3ZG2+FKGMdNzt0Gwh7SRtF4oGEivC/K4UNzHg67RfUgbZv6us5rL7CkX7M6MAePsPCBWK0WIX1YgDobM
X-Gm-Message-State: AOJu0YxaBdg2TwTkHp7fxWnybnN/SP6seSjH4L1ODrf3zWuOQse9Gt1X
 H7dYVRtLGDouVjXwjbmaj13q8cwfB77iWYWCdOHn1Lv2O26GL5/BNg8XDRYikB0=
X-Google-Smtp-Source: AGHT+IEiNk0Cn6MVwI5JAm4CSWs1hj1gD+x4Feg4TNA4+aIpcGR4ZjhqJy/We9xVKcVn1k9NgGuX6Q==
X-Received: by 2002:a2e:9e88:0:b0:2ec:4eea:5dd5 with SMTP id
 38308e7fff4ca-2ec5938a51cmr13815331fa.45.1719126856656; 
 Sun, 23 Jun 2024 00:14:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Remove more useless wrappers
Date: Sun, 23 Jun 2024 10:14:09 +0300
Message-Id: <171912674298.840248.13296926368532998967.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
References: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
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


On Tue, 23 Apr 2024 00:36:58 +0200, Konrad Dybcio wrote:
> Shaving off some cruft
> 
> obj files seem to be identical pre and post cleanup which is always
> a good sign
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: Remove dsi_phy_read/write()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8fd6f64ddba0
[2/2] drm/msm/dsi: Remove dsi_phy_write_[un]delay()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5372db09f4ba

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
