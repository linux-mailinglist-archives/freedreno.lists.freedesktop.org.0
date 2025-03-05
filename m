Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ECFA4F92A
	for <lists+freedreno@lfdr.de>; Wed,  5 Mar 2025 09:52:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6804010E206;
	Wed,  5 Mar 2025 08:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q7dbNbVh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D055C10E704
 for <freedreno@lists.freedesktop.org>; Wed,  5 Mar 2025 08:52:05 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43bccfa7b89so11891815e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 05 Mar 2025 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741164723; x=1741769523; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZC/qen37fd4vBSgLI91hwOumJ/Sl+TjsYB6y5Vr5M7A=;
 b=q7dbNbVhzlFDEAqr18EKKMqGL6NP3ylGnOyy/9Rc9dWwlU4hk4EyuaFMXRBrkE20cS
 X6Thc5AdSnlfhSaVxdQ+NpGWphxvw3og2jftgh8O8gw5Na004dy/1dz3Tx7LYuPdZ5f9
 ALTubDRvPuaMrT42pgwKX7WraxDIbPV+p+2KypuyNAWPnsHnqFzUpSTdpFsYcSkUmYum
 eJHvUUpGvIfEkgLiyh6JBcmj7cIoGEIx/M2aMQYs4qujTSuoOLn0JP9s0BJv+hHZ1drM
 Ria/zhXi5l5dnY/vVHW0vfuIekxc3Gs8tdsBbCwIazLvmP0PqPAYyl43UDdvAPdf+nyU
 c6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741164723; x=1741769523;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZC/qen37fd4vBSgLI91hwOumJ/Sl+TjsYB6y5Vr5M7A=;
 b=iK5ttPPB8wxzqo7ncE+M5h3VxS550vNrSdF7waVuV19dm9p4Esm5Nyky8ullnISonj
 et2lErgg7PwwyLEPCWLnpq7Hz/z8l6rW/XKIcF7bgcMl/TtOpF1sXlvEUHcm/3gJVAqp
 wlwPdp+BtQv3qMq9gahhntH6jrIeVKrVHrg77ofLedaFGnKMDr/jF/f63f6gCNdnSNXd
 nTFxWvlb+aHj2UmEA5LE2yYRXYFy1yqWYJliWdo/JyaeMrEQ1R/qdUOkD50s5sQQHVTC
 j0cBwj+Wz1zjzv4Wo+nDMvq3O0s/B4PAm7G9VgwUIzVcL1zlyCPBm2cW9eChszqps+PF
 l7Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNIpjjn+Ph7ws/RbFiR4sD3CGyLMQ4w766mgpxmJQ/l7hujCO0unU3d7ZHGKff4HHxQ8GrJBYYqlI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7MWYHgPJmXOz8ttJeY9hM2bMNqh3dSIui0ML+FQZrhe1aqEyq
 ll9Q7KjrDbMWYgmx8uhzzWSOy8LeVtvulm0ooVn3L8V2S7gUofcYsUexL9B9B6w=
X-Gm-Gg: ASbGncvJ9lBmnf5IArIf97zSs0OOl8icSGV7kxIYKYaVqkcfO6H7gXAXXwdE3wh/x7a
 SrnEs8z0fKARQH8rDLyt3404gomlugT6c/88rNIchg8fuoB/9m/WdRyzbYIyn4sIy2hOhSOP3LT
 yZDXpMO16U4FzhiNDCmNsp19ZusjZ1nUK8f4vrm1LK9Mn7HgM7xOMLoPGttjMpxatk0fxrkFFfT
 mlNhoWAujBt6y2KfazzECtgNzkrlHDc6MTcgyYEyNhS+PPMIVNI9UPi+TsFYVYIij+LhQ/pVOyy
 ydWrKSJ1Nh3wwlOb5+iV48AEki42EK+l2So32phrDXpkLCgH3A==
X-Google-Smtp-Source: AGHT+IEnll5wrK+ucj99FN5wPB9IJR42RFtfAed9YIQq8iwKwZ5zCrl027CguxNQpWhglI/cbwh/2Q==
X-Received: by 2002:a05:600c:548c:b0:43b:c284:5bc2 with SMTP id
 5b1f17b1804b1-43bd28a3847mr16238155e9.0.1741164722999; 
 Wed, 05 Mar 2025 00:52:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-390e485d8e4sm19946896f8f.85.2025.03.05.00.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 00:52:02 -0800 (PST)
Date: Wed, 5 Mar 2025 11:51:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Clarification for =?utf-8?B?4oCc?=
 =?utf-8?Q?undefined_behaviour=E2=80=9D=3F?=
Message-ID: <4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
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

On Wed, Mar 05, 2025 at 09:40:43AM +0100, Markus Elfring wrote:
> >>> The address of a data structure member was determined before
> >>> a corresponding null pointer check in the implementation of
> >>> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> >>>
> >>> Thus avoid the risk for undefined behaviour by removing extra
> >>> initialisations for the variable “c” (also because it was already
> >>> reassigned with the same value behind this pointer check).
> > There is no undefined behavior here.
> 
> Is there a need to improve the wording precision?
> 
> There are words which denote a special meaning according to aspects of
> the programming language “C”.
> https://en.cppreference.com/w/c/language/behavior
> 
> Dereferences of null pointers are treated in special ways.

This not a dereference.  It's just pointer math.

regards,
dan carpenter

