Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79E99F2418
	for <lists+freedreno@lfdr.de>; Sun, 15 Dec 2024 14:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCC110E0D5;
	Sun, 15 Dec 2024 13:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uCzPSGk5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3308810E38B
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 13:10:57 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-3003d7ca01cso32594061fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 05:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734268255; x=1734873055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cnbx6Y9yMJBvsPZY055b2Z+E7Q3d8VBnIiflj19jBI=;
 b=uCzPSGk58kI+3Ba2bJE33D8zsjL/oIXNKDhZ8Hlh7QcQv+yLzKSnnVaaPHb+UsBTZS
 5REurEwLxLjPfr4+K3Dxt6N/f8A4eYTBvY/q8xzKK826a7yJLe2cWFBvbRpKQ00HbtAn
 uAhridAmV7dwpS2NI6g2QZ1stIbceodiXV4q9xe/RsgULjAFNPckWLTOLogINF7c8iXr
 UlotXV+sHXfsVLBh1AEzRA2n2OK+mbKb89HBin/9aO4PLTSFxWz+aoItkchvs4OqL5k3
 1VHiOfW1VewtGel66zZb2AaArzwoFfeUcyOgIroRjRG3sG5b0zJKk92khR47VfjPpJHf
 uw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734268255; x=1734873055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cnbx6Y9yMJBvsPZY055b2Z+E7Q3d8VBnIiflj19jBI=;
 b=qtx+h1iPkDs42rk3HWf7A4iV+M3gbpECvSNjfplGujl6gby7e2M6GxtxZW5u2EeiUG
 4ifUIOn13GhURChwfBTfJC1f3TeWU5GdJBJbyqnqsePI2hLI7Is/X7z5o94H/0y6TenN
 Ez270HmrEfjXKZepZ69AhDtbAkPMFht7+ywkugpNWNqkgUHtyf76IY6R85ZOV74C8tJR
 UIohM6ko/f4UGUpvpjg98+qpcByscFpGV2rSbqmRVTiRnqC5+DlLEv8aTcFR69MtcpR1
 /rDHBTJW8MQVvC42Ib+uH0JWvouDuDRiNFkOZoVlV2yqFWULi/wsU3l9m0JwZ17I2ZTc
 rBFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOXB8krYZoSABrxiYCoZMlx7OgTdPEXJZ2L0GtDM4q/vcOns/jUWF5d8NMlZw7IDyQCzRLfCmd1i4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxdkk4cR7hdI3len6oFFpV9uZgsG2v49Fqn8OFL8odbb8K3VfnY
 DSINnH1G8Yts9PjdIymHTpXKWvZEARuxTIndD3I+86SlivmO65S7+9FkXnKKN2w=
X-Gm-Gg: ASbGncuvdadfvyoeWY8dtp9Jtc7IZJRFtgEQdBUaGiuGhfntqzGon8EfPE9dFVzqODs
 r9abOjtqjU3rSZ1prH3S8X6nbP+ePyCaZo5g6SvH6ZJBFtQhv576+UdHeVy5QbZFnpj/kSdYUuG
 PvDXLTtATJ+o7yPGs/mJf+j53+Dj+KrYG/c45h0AuYW8HKQx1YqjftHrnt1k9LpJLP6i6q/0pty
 a3Czq/VWdj2OsFTpuohlLr7rcjOqh/GST0nz6DoqV38N2n9xoiuKlKgeJ8qkiAiAUOJiwsT
X-Google-Smtp-Source: AGHT+IHTw20hSoY1t2S8hQDm6sAR/6CNjVdyRnyImaVn8xVxpAXP6KiR+1x/jnjFYeOmyB9D3YqAAg==
X-Received: by 2002:a05:6512:3195:b0:53e:395c:688e with SMTP id
 2adb3069b0e04-5408badcf28mr2596428e87.10.1734268255530; 
 Sun, 15 Dec 2024 05:10:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 05:10:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add VBIF to DPU snapshot
Date: Sun, 15 Dec 2024 15:10:43 +0200
Message-Id: <173426667309.2196979.11608285674325095814.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
References: <20241122-vbif-snapshot-v1-1-6e8fedd16fdf@quicinc.com>
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


On Fri, 22 Nov 2024 15:09:10 -0800, Jessica Zhang wrote:
> Add VBIF registers to the DPU snapshot to help with debugging.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add VBIF to DPU snapshot
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1a40bb31fcf1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
