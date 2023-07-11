Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E4C74F1DA
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 16:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C6F10E3B5;
	Tue, 11 Jul 2023 14:22:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB2810E091
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 14:22:00 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f766777605so9200705e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085319; x=1691677319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIVN6C53juP0Q5iDUT1F1HeifUyBCNpXBYhLUGADz7A=;
 b=F2KzE1D9nWBzFgZ6+NFkRYupZLL5otNkqPs5j74tUMqGFtIH/k6+yxbz3wsFhHgEma
 UQOyUHR7EBb2QRfNeZY9n0/dYZXteFQ5jyBuou0afKMNm9jxtPAzTTXd94dolct3VKAE
 lQ+L1XYD9v4zr4K009AUW/5tNT978pAwwexQH4Y7Rxx2OluCPLu0NUfeORF//HxYhVIZ
 gYnF03fI1nfRck5C2qZ7MAOTTjs5SXcFvC9iTi3ayiSKU5pPavZHgHPoKfE2vNQRhJ5U
 eICAIEnmrI1lyHGmYp6yq1tLnBscBgNxRz4KM0hceuKH8WR64Qj/b5baDRaM5petQucG
 HBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085319; x=1691677319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIVN6C53juP0Q5iDUT1F1HeifUyBCNpXBYhLUGADz7A=;
 b=HZqvhf5hgQQkfRhVfMgd/ofRtNV31GGTwYEgpHkS/FmTeCg9xk3dFklJYqWMdu6U5y
 +kOx5I6KViUdMmP2+Rf3IEGC05rO8iVZn8MBC4WDHQQplVUM9YEeBtBBgogwEyH6qntK
 /oHHNEBHpco/DQ7TDj9m9gIA0Foi2mozB8O/ptVYUqNEQy8jijBW9XRmsFIEKy7999B/
 ymMKx+cLsa/Dj9wuOoO4MnkN/iW0NUu3b8bR8jkGwzZoy0IUj9g1CCtQ6G+YKCtNqkg+
 lFiM0Ocm8VC3LG9Cn5R288FKn5dD4gKMs9NCSO9oKiajjZY9KqwAwrwZtO0oAb9nbiZl
 rPaA==
X-Gm-Message-State: ABy/qLYCCeo4AqOOra/n1vyWAiyu0v5uSXRl2OUjFHLFk8ZHz7n1dOsG
 1Bbhv92113DOVWsLwe13FA8KkA==
X-Google-Smtp-Source: APBJJlEnEc2yw26sZg7r3jOg61IenC2emKJQYboIRLUpgluHvcSybr2bOGCJPNanGdpVVqAUd96rxQ==
X-Received: by 2002:a2e:a170:0:b0:2b6:e958:d03 with SMTP id
 u16-20020a2ea170000000b002b6e9580d03mr12795430ljl.30.1689085319029; 
 Tue, 11 Jul 2023 07:21:59 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:21:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 11 Jul 2023 17:21:48 +0300
Message-Id: <168908465045.1869384.1893558597710112842.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 0/2] DSIPHY RPM
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 20 Jun 2023 13:43:19 +0200, Konrad Dybcio wrote:
> Some recent SoCs use power rails that we model as GENPDs to power the
> DSIPHY. This series attempts to make such configurations suspendable.
> 
> Tested on SM6375.
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to prevent refcnt leaks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a402e0e61b75
[2/2] drm/msm/dsi: Enable runtime PM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4e905c2acc9d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
