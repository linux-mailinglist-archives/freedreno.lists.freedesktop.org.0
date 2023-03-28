Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F486CCD8A
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 00:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6156310EA23;
	Tue, 28 Mar 2023 22:38:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6BE10E9FE
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 22:38:14 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e21so14180662ljn.7
 for <freedreno@lists.freedesktop.org>; Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680043094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALXG480xc5Vr4OawogWrdD2rMqv6eGKjSBs+zM3zYaM=;
 b=ZnE7Q8sUOjiqKZEboynjLw/+ePjw37a8mPY7dc9ZWIocCk5H6ZEdBmGgD949C1HmO2
 osgYB5U3gaRjuZu3vALD7fvCrLe2CChixj3Smn2DJ9goJ2li26clkYLVYgfG4fbNGUaT
 o7+iwdt3KRAh7nS3OtWvbI1bkdBjvYIz4axSVPbX9xSxkR7aOCDvFbjzPrwDluUz3E0U
 8z8KPEeP4ctRqHdA382W+kq1N1FqTvpz4jRBENcP+AUdfmzCxx9CzSI/RSfItZ+Axzfs
 uxBSpA6SOGlj+d1cZ7rBPeQMdw15xDaThvq8l0Mni18Td1Oppg2FBXxqkkH9It2wzVIh
 Qp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680043094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALXG480xc5Vr4OawogWrdD2rMqv6eGKjSBs+zM3zYaM=;
 b=bOqiEa6dDDn3bi0pEou5wwiVDpys7jWmqXYNIbUI0zllP1+RsWIvszwsDhnZFVCC7V
 DSWa7cFkmlEmeSAXkVE4+wYIikYYAn6eQwM0DufTwwHVaKOCVCGqZgXKNXYgB1aojDlm
 MN7FnH/ED5yoEX6ACWZbsUHYcPDJtgD2UOV0SNhWe0E2ozDwDFiQc1O6B5CH7ysrVp9E
 qzKHCzvrmil4DFS8f0zZhWneFoepWyd5ydqG7xz5w2qqsDt4BPX968vzQEMZ+X19L0Z6
 2NU1grA5zbRgvubifWJDQnxpMBb+iedz1l+Bk43EvrjM6ZxjwJG72LZh3CjrDR7KpNUr
 4sOw==
X-Gm-Message-State: AAQBX9fwVTEWG5aSfBW+O29TF9tGEmMiJMFUcyBF8XMSdE7NxEeH4yEI
 IaYIniLe1BMdjB6pspP1Ggxkqg==
X-Google-Smtp-Source: AKy350aFicRWvswRoDZ1yiFEWcuTzTmpHjlmzTrMbuXCU8Hhw3+v9Dh3klrbsvbczbJGUmIMYntQ1w==
X-Received: by 2002:a2e:9883:0:b0:293:5164:4f2b with SMTP id
 b3-20020a2e9883000000b0029351644f2bmr5174878ljj.8.1680043093924; 
 Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:38:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Kalyan Thota <quic_kalyant@quicinc.com>
Date: Wed, 29 Mar 2023 01:38:00 +0300
Message-Id: <168004255467.1060915.667380054091133744.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com>
References: <1674814487-2112-1-git-send-email-quic_kalyant@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [v12] drm/msm/disp/dpu1: add support for dspp sub
 block flush in sc7280
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 marijn.suijten@somainline.org, swboyd@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Fri, 27 Jan 2023 02:14:47 -0800, Kalyan Thota wrote:
> Flush mechanism for DSPP blocks has changed in sc7280 family, it
> allows individual sub blocks to be flushed in coordination with
> master flush control.
> 
> Representation: master_flush && (PCC_flush | IGC_flush .. etc )
> 
> This change adds necessary support for the above design.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/disp/dpu1: add support for dspp sub block flush in sc7280
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4d5e5f04e596

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
