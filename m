Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336246635A9
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D816B10E532;
	Mon,  9 Jan 2023 23:44:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F9C10E520
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:14 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id f34so15577865lfv.10
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHjEtNVaTqOtCpnB9ZP021rbETT/k+vzPdGSi2OKKbk=;
 b=KdluC5isYfGPedU/R2fjuuNpCoSuFF1Gex4PxTwA/N8jNDHS/AVQE5mKglBc1iQzkS
 PsYw3u+iVbQxMe+TjLhY/zIwy1l/27O2gFVrl2UK7tdwpA/NEej1wX+R514XKyLF+uSv
 xHsN/YuPfGmmfmBKCwj9zCYW+8Oc3ryiysNMANUaS+wodqw0J5mEFq3QoHYnY4t3Lzjg
 FeXOAW48fZW+o7VQhUl8UGSy3Ji3tHu//ALLLsKYTDdmCo9/IQWdubtGXEHiGiIXDctP
 vHyW137kiAwiwBvnxNWqh9LLcNkjZbml1VAWAHKK2831myR9iU3oxsy/g9IJ30OGHok9
 yLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHjEtNVaTqOtCpnB9ZP021rbETT/k+vzPdGSi2OKKbk=;
 b=nHJxhFyKLrBfyW8LTD0er/ufkVXQFYzv0KM1e9QCsRK1Sh2sHxgWxlc/8sFHp0HeVu
 4EWTEuJFAXS8ri7WBZiUuDe0v1gHHJkaqQfq4gqpah74UPDLFP/hR1Qq4wRm34Nahsol
 J4FPQjPmrJziWGiO0o+fTv93MxdH7L3jQ07s0zGpsfx9j8hcv/1yR/YhEE/VeFjjXVXM
 satD3Ie9edcUwbmQjzHPa4EC+JuAU8vGIHRpSQqdngzEm/uxbCq+KcHPGGQAysp/MMED
 3cN1ZVmsF4DFRhcfFe11OmMOVJuav5tXY4K8yUH3iijUb8jquh9RKTnKai0xhA4yu9SO
 vB8w==
X-Gm-Message-State: AFqh2krZmsPj9dweHLl7RFAaxH1yMtZHqT1Y+sTGOY7ng0CWbgZ78sFM
 6CDTY6DGfxYpMe6dPVKgXRWaMQ==
X-Google-Smtp-Source: AMrXdXs4hWSrnGESPaDMiC7Skctx3mIanGzpIn+a29djjV3HrxocDoxhqI+rKdtTzMIxIdZgqlnGAg==
X-Received: by 2002:a05:6512:3b91:b0:4a4:68b8:f4e5 with SMTP id
 g17-20020a0565123b9100b004a468b8f4e5mr23148885lfv.43.1673307853915; 
 Mon, 09 Jan 2023 15:44:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com,
 daniel@ffwll.ch, Hui Tang <tanghui20@huawei.com>
Date: Tue, 10 Jan 2023 01:43:59 +0200
Message-Id: <167330408783.609993.13860899129914018447.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221119055518.179937-1-tanghui20@huawei.com>
References: <20221119055518.179937-1-tanghui20@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: check for null return of
 devm_kzalloc() in dpu_writeback_init()
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yusongping@huawei.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sat, 19 Nov 2022 13:55:18 +0800, Hui Tang wrote:
> Because of the possilble failure of devm_kzalloc(), dpu_wb_conn might
> be NULL and will cause null pointer derefrence later.
> 
> Therefore, it might be better to check it and directly return -ENOMEM.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: check for null return of devm_kzalloc() in dpu_writeback_init()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/21e9a838f505

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
