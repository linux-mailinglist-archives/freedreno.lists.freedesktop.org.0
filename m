Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B573916B34
	for <lists+freedreno@lfdr.de>; Tue, 25 Jun 2024 16:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF3610E6A0;
	Tue, 25 Jun 2024 14:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n5MwYirC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2235C10E69F
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 14:56:43 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52cdb9526e2so3361331e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327401; x=1719932201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uy311MtfEgGTpcpC73Q+KNbvwGn0qsgeTmIktNcXCxg=;
 b=n5MwYirCG2IyHHlrwJ3tTkFN7Gl+GzNqimS6TSv5NVJrrWm0MjSF8dNJr7fct3CkWS
 7apcR1JfUNu5sBPlsWtP73/nSQNTPei/dg0bBP5osh2FLa4QbieFQfA9L+uv4b2+U9aL
 /pMzEf63mwISHIhz88tSupqBQxkskDpqV8QY6QTGtpOEYRVW52M7YKoRFRFRbvBoT8/l
 6UK38EFi5ax/oyTbtVaqRenUZL4RS+t0oI9pdTzV1VQElfj+uaLfXrXJ2WrMyQ6EALiW
 SNcMqpchnqnpn2QQDecLjBNajY9un3xaBgOt5Nf3pfpxjaC2D5IBHnl6HnNgJqvgH9dX
 y5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327401; x=1719932201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uy311MtfEgGTpcpC73Q+KNbvwGn0qsgeTmIktNcXCxg=;
 b=oZ+Us5YhtBuoQfbE+jhPlmODz+3boQrMS54kKZ20J/LedgprlV16FX0osm94jQlRPo
 I4Nl3rzF122SkvTiXtxG7wiU2+2oNiJuKqu7sLu++BTl7+c5WA644g/KdmnXgF9n4WXY
 9o//9xEzuuqQThTiHhwwqujupnl5guMlS6aOpSriqI+66879+V+OFY1P/3y7jDB9yrI7
 xmz3jJ+fyojlQUzUH9Lpv/uy+9Wy9VV5vhYnMjl+PxqNMJiSOYN+yp0Fds4gmioVTbKH
 D01N/1GZp/ILvO/dGTSZ4u3ESPdppY9wwSTxLdgOezwoRcFy9h9qJPCr2OvUPBoE+t/8
 sY8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2EB9mA5nGxbi565R1UuS9fwqr67t3wEwt8/994ZGBODo3a+VYzUSlZkcguiW6TL1uiB57I6eCO2su/tBXdp8GCjPuYwg8Vl1J3waNe2He
X-Gm-Message-State: AOJu0YzcfSi2E8sDbsok7J9XU3XqSzL8ZmxkhqY60WE0ZHFltIYFnqvZ
 SUuKMBX+mALAuadFz5k7PUSa2FaWA/8AE9JU8RGCHmUM9cOfqwqmyUKikw2mokQ=
X-Google-Smtp-Source: AGHT+IGWSJ98xqTwdcAivnfx2Wmxx9wwkmjEWPIjZM3yst3js43OpqE9GybEuzYV29mv3KYo82eBaA==
X-Received: by 2002:a19:8c58:0:b0:52c:aec9:790a with SMTP id
 2adb3069b0e04-52cfd46b51cmr128113e87.7.1719327401071; 
 Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:56:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sireesh Kodali <sireeshkodali1@gmail.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
Date: Tue, 25 Jun 2024 17:56:38 +0300
Message-Id: <171932736813.1437673.16795984015504704928.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240624-msm8953-mdp-fix-v1-1-be4d3262ebe3@gmail.com>
References: <20240624-msm8953-mdp-fix-v1-1-be4d3262ebe3@gmail.com>
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


On Mon, 24 Jun 2024 00:26:01 +0200, Barnabás Czémán wrote:
> Remove MDP_CAP_SRC_SPLIT from msm8x53_config because
> it is not referenced in downstream.
> 
> 

Applied, thanks!

[1/1] drm/msm/mdp5: Remove MDP_CAP_SRC_SPLIT from msm8x53_config
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a3a6b350eb6c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
