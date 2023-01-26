Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B40CA67D4EE
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F15810E97C;
	Thu, 26 Jan 2023 19:01:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1802610E98A
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:22 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id me3so7675758ejb.7
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/MQtjH1mkm7AqWVUG8R8PxBUPeeTUYPrWIK/5+KgiA=;
 b=BUicY8w7Cg4CvvVRquFV+WJ0QeOwi6vsbrxmHOhMGwV25qxRXRkUT9iPFTPebUc/88
 g9f/A7OOf1p2fdc/6q8kVGk7cH7/HBZFHg+7sOuL/OmO0FVYpXHAd350rwqRm15A6KKy
 aOBpNvSsoTfUN45J+ewLql9fUXdHwPOarMsXRbuu61l3OQLz0HV7HaIVKHvKi2e1bXJd
 sUlqHs/0NZKIxqoaH3Ih3XlZIa4BIRysmWxdhg4gnOgfdoMPMW0MceWRR9VcPKBLjFfa
 pBOMZBlqowhKoCBDFLv6a0BUnSqNlWM5iQ/zNQoAr7/hj/2mwE1icrYn0ALppYxhmTJW
 tuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j/MQtjH1mkm7AqWVUG8R8PxBUPeeTUYPrWIK/5+KgiA=;
 b=jAcXvhBPkN2pMYS6Kra3Bl51uoRmEGteLRAgx5GAU+hp1sJRIfaWa2BGcHZwzmIw2I
 /jMwq1DCuguWWn9MHd4k8nVR2shtFaMAVL4XISlZ8ZlCl50xjj/adJ0ShXDB6ZKTR5Gj
 Q0KynSCWMHuiUiawgRP3x/cInc4fCU14ay/XBqHRGkqOeNMjuI01Nbn+P0ZZFHZCYiaU
 q8aoynsCHxEk+Fnb2RM3zwKlCu9sqa2z5Fogj6yTJb9k41GW0fEMAudAwBXtjPHtU/mU
 n0R9zSOMzJ3XQkiTIlpWnX4f/7LU51AOFlsADix6GakxlxLS+uHchbbXYFRTuWIIiUM5
 /DnQ==
X-Gm-Message-State: AFqh2koDdh8S/X0HTO17nD5ZrnMA61BcnsOsEIzZJQGuFq5OgrftI5tz
 8ToWu7OmYqGYBzSuJknm+A/6BA==
X-Google-Smtp-Source: AMrXdXsXfrQy45Ya6lKA6L50vJMUW7P5TrZp7aWrVmJXxSfb3EXhEPKbWX5+uG1SZBE6FL4mJZco+A==
X-Received: by 2002:a17:906:9e20:b0:7c1:10b4:4742 with SMTP id
 fp32-20020a1709069e2000b007c110b44742mr31676549ejc.55.1674759681746; 
 Thu, 26 Jan 2023 11:01:21 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 ville.syrjala@linux.intel.com, yang.lee@linux.alibaba.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>
Date: Thu, 26 Jan 2023 21:01:04 +0200
Message-Id: <167475959090.3954305.15850906427772630673.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221206074819.18134-1-jiasheng@iscas.ac.cn>
References: <20221206074819.18134-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: Add check for kzalloc
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


On Tue, 06 Dec 2022 15:48:19 +0800, Jiasheng Jiang wrote:
> As kzalloc may fail and return NULL pointer,
> it should be better to check the return value
> in order to avoid the NULL pointer dereference.
> 
> 

Applied, thanks!

[1/1] drm/msm/mdp5: Add check for kzalloc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/13fcfcb2a9a4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
