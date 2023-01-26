Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23EA67D4E9
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149EC10E98B;
	Thu, 26 Jan 2023 19:01:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26A610E982
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id m2so7225882ejb.8
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+PV3o64mySToMwB+lYwZix37qEFlzbLtvyQStVksaE=;
 b=br8II8E3lVtGw4b1UqtDJw9xLmFQVU23gZp5vs8W7xufTsvviQxqJs7JuOPE1U0v5k
 yVDsOWYlyobuD2sEN4bAyoiufOthIExRq9MUIkTNQ+v69C8It9cxqlbv4rQpHdcbplwl
 /FEr36Ej1VaUmZ9mrkaaRuwjDnebICJ7FUuPEUDuDtzFEmvFppgdmW6gjS08oYGeRr3C
 RsOvP2y7O5KSyQkJQs92M+Cqv6JOVFi7BatoWKa10JqlzP28OgzxbZ+cex6KxOZ487UX
 GXDlcvHrxkz3wlLT+nA058ePpcggG99nhrlsoDpgFHXWx1fQkLC29qMQJE/6Ie+aWjPt
 xPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+PV3o64mySToMwB+lYwZix37qEFlzbLtvyQStVksaE=;
 b=Zg6rKo8EIRSsVyrNwPfhZJlu/Bo5V5HWC78kJLXwhM05oUW9t6LVd7F0CdaabGG0jj
 +yTnRF0/2b24ifmq5Lm9Yi0BrA0GSJ5ez/JLHOaujJ+7LqpPy/5mq+M7Ltu9/54eM64x
 ROl8a4f+346NPE2vElNSxoh5/FxoA5I7NrwtlsdwkYwpptuUTvx96McWCtgEh6Rgk3Ee
 7GleFK6qZFEpZnNKPLdoVw1vhjtHJ5CK0NM+ql6yb1t0Bc0Sr12bfSnYgZYPUm+pSJoh
 ZrulaVMZOmC01sHFuHkNvDU41futABA8ty4CHyb0Ai8c5w94h8tV1eE+u/ceHohXM2dz
 90bw==
X-Gm-Message-State: AO0yUKWf6CMA9ksMXyYNm4xEZVPTzp+gG5k82Nhvv+QsfjX15VrRr1UU
 jezrH6n6kd7B/3JBqWu70B6Y/w==
X-Google-Smtp-Source: AK7set+i6HKxfdpJxTA7ijTraS9Vw4nPNPJJDNQ8xDtWwc9qKbtnSjGlUTVe66JQ+Y82lX7IY88ZvA==
X-Received: by 2002:a17:906:d974:b0:878:7a0e:5730 with SMTP id
 rp20-20020a170906d97400b008787a0e5730mr1936103ejb.56.1674759680548; 
 Thu, 26 Jan 2023 11:01:20 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 ville.syrjala@linux.intel.com, yang.lee@linux.alibaba.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Date: Thu, 26 Jan 2023 21:01:03 +0200
Message-Id: <167475959090.3954305.1335839969306082106.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221206080236.43687-1-jiasheng@iscas.ac.cn>
References: <20221206080236.43687-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add check for pstates
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 06 Dec 2022 16:02:36 +0800, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer,
> it should be better to check pstates
> in order to avoid the NULL pointer dereference.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Add check for pstates
      https://gitlab.freedesktop.org/lumag/msm/-/commit/93340e10b9c5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
