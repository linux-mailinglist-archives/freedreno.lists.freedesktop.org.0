Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614E0721444
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 05:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C683E10E113;
	Sun,  4 Jun 2023 03:01:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0668C10E127
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 03:01:49 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f4bdcde899so4439092e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685847708; x=1688439708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QtZdx8VPfoD43LcN321S8R1aRuJCVhuM31iNj9CzZBg=;
 b=gs9KsUkjmXF9Nkkokk4HdPi6t8M26KY8Y+CWPUb5euQdK6RllukgoprfdEUYbvdCMy
 U5Yzm8RHiMNVbaUwpKxQXx4YRBUvhYEZliT4xVfE4cSiQMZaGZU7Q5Xu/km6qROWYVkQ
 +JRB8PSxQ+YXXkTQ6/7G7c/KyLxblkqb7D0ePuJTf7MwbnHdzGwFixReqHpiTsfPtwTm
 +RL7ajisHfdEXg2GkkQm6Ty+ArDaV2+e0sB/q2/HYHY7lfI8NFjT/T1cS2sxC+S8Q+Es
 JVSp/nRGNEfl2k4R+sQjOpCrkzfdvIO+ves7JxCIfjTwq6pgByPV0xESjU7sQJCcggUb
 UILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685847708; x=1688439708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QtZdx8VPfoD43LcN321S8R1aRuJCVhuM31iNj9CzZBg=;
 b=j0ZXaeB5cqW6Qlr3hqkwtF7rYTiicmVNZieJ9hs87MFBBnY/JhErv9Jx7lxHED3kfB
 XaRk2z0Jo4PJsTXeX2Kf9UZTqKy/fqn6EO//xMJEvWlAcoPIBsEdJdyop76UkzbASqHa
 s5sCE9pROm/tjZfHDcKVvFpTHPhjLRhyTMJW2JBLgEEWGIA6+Dr6xQ0HjvgJFBOf73xU
 jSiRKIJkbziff2QJlO5xZH68R/RXHXviDHDqzUI0EeDWXB2tyYwvk7UHF9fJyPFG7892
 unuaMK4+4IHOUv8U2RDzizRhEA70Dmq6vG9WWGRKHVVy0LzoR84VIVCrkkdN/jj4lEaA
 zQKg==
X-Gm-Message-State: AC+VfDy9kT6JdRFWYp6SDN0+lNPU1sdu0WdlZsFBUL+ZOrNFvrmUU2th
 81iRb1xIVrqSjF1b7uBnqKJiFg==
X-Google-Smtp-Source: ACHHUZ7DiqTKdDpgxC6h5ke18d9gZSPA85LosaMquHyK46GcZQQFpzWj+2anUhv629EUWNFZalOePg==
X-Received: by 2002:ac2:531c:0:b0:4dd:ce0b:7692 with SMTP id
 c28-20020ac2531c000000b004ddce0b7692mr3398444lfh.46.1685847708607; 
 Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Su Hui <suhui@nfschina.com>
Date: Sun,  4 Jun 2023 06:01:37 +0300
Message-Id: <168584750428.890410.17475920431206937962.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522013213.25876-1-suhui@nfschina.com>
References: <20230522013213.25876-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Remove unnecessary (void*)
 conversions
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 22 May 2023 09:32:13 +0800, Su Hui wrote:
> Pointer variables of (void*) type do not require type cast.
> 
> 

Applied, thanks!

[1/1] drm/msm: Remove unnecessary (void*) conversions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eea9cf72b718

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
