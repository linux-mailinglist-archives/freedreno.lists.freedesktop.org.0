Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C66945A5
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 13:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203F410E593;
	Mon, 13 Feb 2023 12:18:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FD010E593
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 12:18:17 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f34so18569478lfv.10
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 04:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=list-id:precedence:content-transfer-encoding:mime-version
 :message-id:date:subject:cc:to:from:dkim-signature:resent-to
 :resent-message-id:resent-date:resent-from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U56UrXaFt0mPlSN93LNd/4TPFAU9tpIeDztZRViLVrc=;
 b=LWTVkLACcr9qKgCKKPqEIIzgPzZqi40CxRASFO5ZZsNT+zRzRALz+EH+p7LhUxOZXF
 Ug4Pm/wGUSZPTQBMB5L2qQfL26CNm/S9aKaLfAFtjR1BTAngAmcfgsmfHxv//PVec1R8
 9KDZsQo1Zov5JOJfIE9Rxy7l71anAfcHnxoCb9GG7gzcspEQqV19YjA9huiaKvKrrWMd
 +BQT+sFTEKT8CNwQFDSCLwxJiJHtWSBG2NY6Zhu44t8h2Wb4rrw59vaQbwomC0qyEDYQ
 quwZNdM/XuH0IfZMhJyC9TqtRMVxJctJ6WCs1+lMwBw9pZicJdx55ZNu4iCVYv8CRTvO
 mZbA==
X-Gm-Message-State: AO0yUKXyJ6O9CP3qXAyX4s8QIhmcM9/2NQtJTCK1f7YS2Nmov6sUIIoV
 p8Kdcm2B4dCB5cHXBW8nU1TCRjZUixg68Tek
X-Google-Smtp-Source: AK7set8gYOeuaszm4NBJPLUpu4KMVbHjMC6bj4kdHCpaFElG2C6Sm7JadCAwJwVdtsBE2H+1rWENnw==
X-Received: by 2002:ac2:561c:0:b0:4db:29f8:532c with SMTP id
 v28-20020ac2561c000000b004db29f8532cmr2816244lfd.33.1676290695224; 
 Mon, 13 Feb 2023 04:18:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 bf27-20020a2eaa1b000000b002934b926e32sm1122436ljb.66.2023.02.13.04.18.14
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:18:14 -0800 (PST)
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Resent-Date: Mon, 13 Feb 2023 15:18:13 +0300
Resent-Message-ID: <Y+oqhYzW02wB/3kH@umbar.lan>
Resent-To: freedreno@lists.freedesktop.org
Received: by 2002:a05:7010:1829:b0:32d:ed3d:eb8e with SMTP id q41csp3111867mdm; 
 Mon, 13 Feb 2023 04:10:42 -0800 (PST)
X-Received: by 2002:a50:d756:0:b0:4ac:b7ba:3d58 with SMTP id
 i22-20020a50d756000000b004acb7ba3d58mr7231452edj.12.1676290242141; 
 Mon, 13 Feb 2023 04:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676290242; cv=none;
 d=google.com; s=arc-20160816;
 b=rIy0haGaihZOpwi6looektvfxvLRtq1moBoVCH5aA5sv5/3MN+3Co5acO2UyZ8BlVa
 t12tjn7JiTjZaNzQipJlBS/OjRSYid1yhGkP2yn/UnlfBJZSyjx/4DHv2GyfN/+UyDbR
 Mx4O177XregiUQBRuPuFbczx4viqp8fNdwwPs+2+NmpOCtSZzHrq5PhargVhOPcDRDzP
 JzXe3RXoIRdwL5C00vqoyk4arM3nnREvupuettYbmJFP5B+ZFuNKmVvfrAiEN1V7zqnQ
 07UPluZN8wZNv6y4g00gaaCShEOPPbhqJMFkLYhDLCzeCkrl5RLbOt+SIDmGWGAHC+Ln
 RcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=list-id:precedence:content-transfer-encoding:mime-version
 :message-id:date:subject:cc:to:from:dkim-signature;
 bh=U56UrXaFt0mPlSN93LNd/4TPFAU9tpIeDztZRViLVrc=;
 b=AAubpaeNi0s7jODxrjQvQFwr+HIBPechVnhpJpaUW1JNyJtJ9JtVC2tErmSOq6085L
 ebgB2wWLrwZZYqz2koKtqE0wR8h9CHPt1tuHYAxFQuDDzwkol23fYsWR+z5KULAzwH4G
 q7bEsGDqLpynsVS8W1v9/AgM8VuAsbY/9dnpE5Zfwo0NraIYNhCob2Q47BwJpQQwNedt
 P6fVjcc+4f3P+R8cj2zW+9gc/WPhd7gQZvq0wvJafIYXGrTgM8lwcQvJw4NEodoEvw29
 hcvbfKU1e1H1ZNy7xmhftxJq/reS5TQmZLg3oTFpd/y8ujI6QGPZDyabucscVirnKe84
 nG1A==
ARC-Authentication-Results: i=1; mx.google.com;
 dkim=pass header.i=@linaro.org header.s=google header.b=MWedDO2B;
 spf=pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org designates
 2620:137:e000::1:20 as permitted sender)
 smtp.mailfrom=linux-arm-msm-owner@vger.kernel.org; 
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
 by mx.google.com with ESMTP id
 b25-20020a056402139900b004aac3fd9113si11997053edv.108.2023.02.13.04.10.41; 
 Mon, 13 Feb 2023 04:10:42 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org
 designates 2620:137:e000::1:20 as permitted sender)
 client-ip=2620:137:e000::1:20; 
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
 id S230300AbjBMMKk (ORCPT <rfc822;vincent.guittot@linaro.org>
 + 12 others); Mon, 13 Feb 2023 07:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
 lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
 with ESMTP id S231406AbjBMMK2 (ORCPT
 <rfc822;linux-arm-msm@vger.kernel.org>);
 Mon, 13 Feb 2023 07:10:28 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E174196AB
 for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:10:17 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id sa10so31225640ejc.9
 for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U56UrXaFt0mPlSN93LNd/4TPFAU9tpIeDztZRViLVrc=;
 b=MWedDO2B4RvsF1JyZyVT4Ln9oIZ1NBgnJ//OnxHaogVZS2WfEhkvAI/yO7BkRzgyHw
 Wm1/fUo8NqV0QxntOLpvhrOURhljqwpORLlEKRXKVJdL33Hp93h3SN3AJHFKS7MAxhQ5
 Pjf3OpfgK9GO2uEuqDgIA/bXfLUQnDpYdaoY1xYPogMqa+8MCHfwdf5zvtNvVusB5tgp
 dDDVlSqDQzqy8SNgMz1mYgqS8r8iKfzENiPsFn52BJFjTs1CrJy+YW2PjKPr7vbr4xRK
 cRE3xLI11wN0rv1DSOeGPM22W5qX4pgSf57iIHX9hm66OiITXToydw0aG5b3qfae4K9d
 OzRw==
X-Received: by 2002:a17:907:9484:b0:878:509f:798c with SMTP id
 dm4-20020a170907948400b00878509f798cmr29395703ejc.4.1676290215627; 
 Mon, 13 Feb 2023 04:10:15 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:10:15 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 agross@kernel.org, krzysztof.kozlowski@linaro.org
Date: Mon, 13 Feb 2023 13:10:03 +0100
Message-Id: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
Subject: [Freedreno] [PATCH v2 0/9] Fix DSI host idx detection on HW
 revision clash
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, marijn.suijten@somainline.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

v1 -> v2:
- squash the 2d-array-ification and fixing up the logic into one patch
- drop num_variants, loop over VARIANTS_MAX*DSI_MAX unconditionally
- drop inadequate Fixes: tags
- pick up rbs

v1: https://lore.kernel.org/linux-arm-msm/20230211115110.1462920-1-konrad.dybcio@linaro.org/


Some DSI host versions are implemented on multiple SoCs which use
vastly different register maps. This messes with our current
assumptions of being able to map {dsi0, dsi1} to {reg0, reg1}.
Solve that by adding a way of specifying multiple sets of base
registers and try comparing them against the register specified in DT
until we find a match.

This removes the need for the QCM2290-specific compatible which was
used in the SM6115 DT (which uses DSIv2.4.1, just like SC7180).
The series also takes care of that.

Tested on SM6115P Lenovo Tab P11 and SM8350 PDX215

Konrad Dybcio (9):
  dt-bindings: display/msm: dsi-controller-main: Fix deprecated QCM2290
    compatible
  drm/msm/dsi: Get rid of msm_dsi_config::num_dsi
  drm/msm/dsi: Fix DSI index detection when version clash occurs
  drm/msm/dsi: dsi_cfg: Deduplicate identical structs
  drm/msm/dsi: dsi_cfg: Merge SC7180 config into SDM845
  drm/msm/dsi: Switch the QCM2290-specific compatible to index
    autodetection
  drm/msm/dsi: Remove custom DSI config handling
  dt-bindings: display/msm: dsi-controller-main: Add SM6115
  arm64: dts: qcom: sm6115: Use the correct DSI compatible

 .../display/msm/dsi-controller-main.yaml      |   4 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                 |   6 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 161 +++++++-----------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   6 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  14 +-
 6 files changed, 74 insertions(+), 119 deletions(-)

-- 
2.39.1

