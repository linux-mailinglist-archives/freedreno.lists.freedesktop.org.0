Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E2376C9EF
	for <lists+freedreno@lfdr.de>; Wed,  2 Aug 2023 11:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193AC10E536;
	Wed,  2 Aug 2023 09:55:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4722B10E532
 for <freedreno@lists.freedesktop.org>; Wed,  2 Aug 2023 09:55:52 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so10901932e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 02 Aug 2023 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690970150; x=1691574950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g3f9a0bqaXmmtqQwbJx6feRw+OxMSPGWZtZpS80ibCA=;
 b=TsJKcJ4yS+4vQ3C3KyyOdARzfk2j7dx8adqXZ7Vodft741sJJC8JXHqCFds86wXwej
 qESohiG6KA+3asWplAABmzuMmvTuko03NiF3hzUyb5GB2+eosnAl7+FAu9ZxBElkF/ux
 Oud3ZV8nuudqi6Bd9CtI7cgEi8AZfsc9/QaOD2Kz7RFeoQKNoU1bsFSdPCfBf/miIasS
 2UnUx+DLvRociKdqbZISdIElvZDz1+EBwOhXAudcLqsyz2x9w95peJGgNsfrBjZfNMA+
 twpZJhWribksSbomuAZgWLi67yCoMsn+vhHKSrm3wuMb1ESfqpWy+KkximQRMQXFGyf0
 qc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690970150; x=1691574950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g3f9a0bqaXmmtqQwbJx6feRw+OxMSPGWZtZpS80ibCA=;
 b=RITaP7qCkQ6/p+DVXSQ5fjt537tStpDZH7oCl8A7OveZXRdFsq9BrYpHabEatdMYN0
 QC0uatMVw9tANIOJSvaWrIPZRJ+NKSeos+rdEtO66Ny4VUdnJNvEPO9HMXA8r36UObVT
 sqKe+trehEDazoXa4iAs8CMMBUE3Mt/u+FPX2kaqQroVXce2C7L+g+FLBudgDfXP6z/R
 jNBJubTt1h5nLubsSUQHh5l48jqw7E1iBTX882SQVMtCKLHE63BYULTkMoyAi4tu4jGD
 LnONqqpROBA3JfyqpDfuj8gNMNkjEB3lFtpP4SpESi1Q5S77B7Y9toqVaaARAW68B5/3
 WEVw==
X-Gm-Message-State: ABy/qLYPXoG2EVhKrgZ3YV3AGWc8Bc9NxXSeZEHfTXQ3zd3eFsfHQQwp
 lgouPzEuqK35PNLkptUopl+QVw==
X-Google-Smtp-Source: APBJJlH8PxyhUTN1mgA7mgCOhBeQJg4KAK+rtWR5LQCJoz3DfP5YUZqpJdz9DuxfNw42F/LERt4eUA==
X-Received: by 2002:ac2:5319:0:b0:4fb:7c40:9f97 with SMTP id
 c25-20020ac25319000000b004fb7c409f97mr3788949lfh.27.1690970150547; 
 Wed, 02 Aug 2023 02:55:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac24891000000b004fe1960dd7csm2779762lfc.132.2023.08.02.02.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 02:55:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ruan Jinjie <ruanjinjie@huawei.com>
Date: Wed,  2 Aug 2023 12:55:46 +0300
Message-Id: <169096995980.4183272.6381311756168703819.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727112407.2916029-1-ruanjinjie@huawei.com>
References: <20230727112407.2916029-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH -next] drm/msm: Remove redundant
 DRM_DEV_ERROR()
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


On Thu, 27 Jul 2023 11:24:07 +0000, Ruan Jinjie wrote:
> There is no need to call the DRM_DEV_ERROR() function directly to print
> a custom message when handling an error from platform_get_irq() function
> as it is going to display an appropriate error message
> in case of a failure.
> 
> 

Applied, thanks!

[1/1] drm/msm: Remove redundant DRM_DEV_ERROR()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f09f5459bd85

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
