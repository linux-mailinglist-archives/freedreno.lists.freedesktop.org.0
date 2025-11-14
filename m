Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39AC5D92B
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397F610EA99;
	Fri, 14 Nov 2025 14:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxOhnBg3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcZdOY3Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA6E10EA84
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AE8De1T1477262
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kVORcd5BmpvweB/Iw+GyMgCzu0ji3UnuYmatjp2GayQ=; b=kxOhnBg3XvmjeOzE
 B3mQ2nJExBuvH/Y1wuO9u5ude7VfF2xLSaJ9whpA6bv7gEj7rk5fy9tgvj+f75P8
 eyXZWQVYCkUF/0hIS6mz00UhIss8JQs8vB1FwQ3d6wQtZupaKaoj2YIXRlcofmGg
 fXm5lmR889etm2n1YxjnynBgJiIIKalU1+1DHaDNmfG2nSlLiyy9z04LlqQfXXz4
 rpUCatgUdcBsET0IMdquPxZc7jRQjOlwtUKn6LQQioXlujibC5+YZ9ZPgKvbcPaU
 NFHaqWFSAbDaiPuUANHlJDruvGyumFQaVp0ZTSa9vdVrzf9A+sx9tz2WjgSWx8GG
 xgfJ0Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9dtdgs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edad69b4e8so52707181cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130407; x=1763735207;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVORcd5BmpvweB/Iw+GyMgCzu0ji3UnuYmatjp2GayQ=;
 b=ZcZdOY3ZTkOJy2kX+qBTW+bwKf/IrUNrx+xrQEZA2cpkcl/vlR1FMcwdXBiWjod6QX
 BqGw9Nsc1MnbUJ7NjgWfdy5PVA0xtmOm4Z/awGQ/N7c+KZxv1nrG7dAwpThUUEw7lITO
 wQX9b1Ox8R8KO1CWd2GqDEqVnxpWZu1FIQiTbWFt5BwumaowRQ8FJ69XsDkjcdUaheVc
 ht4RLFQN/1GhelJT2zdF3FXQHoTt3j/Fi1PXqYBFqV537BGg2rxhniXVmeMJ2a12PwpS
 9dL9yBG+PFVgcRTZ0p97dkuhwpd8zWPLfTkcMxeUo/aFq8Iwa1Alpd5h5U1yxZ+E/DX4
 p/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130407; x=1763735207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kVORcd5BmpvweB/Iw+GyMgCzu0ji3UnuYmatjp2GayQ=;
 b=bnRFcQ2GMdz/i7XKTU61iRqk5WM7SkriRGxnFH8nOEKcYyMNN1kSOBp3dU8h09pfMa
 BQIhE4gHiyT45dSC0WhyrpV2487YA1PwJJ0wr1R98VRWlAP64sZqeWhplJ5yY9s5l3YA
 z3hTjsH7JOaYRTfpAlqSy6AlspCVodeBT1abPRlikZexndJL8m6B0iqy/3IKJmxGj46s
 idTT5oJfitAI0PX9h+rDGqdhosLxcUl+45nZv8fK7yaKQYUObjNLeqZfkPRRYP4roNKP
 G3N8413F3kq34QCeBl0Ucaz8zXHVABiJ9WvpJb7KHrmTsfvOe2YfFUl2LuTldQSutRFW
 vtEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxvvNIBeR5AbEdtfqGQI1s3MS7ZdqsiEfVyCt0RP+FEKCjjk5yIaPrSF/b/QyySCTx3ohHTLQDdb8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4e2TQFLdsNGZQEWFYQDtszZawEz0FSeOJGobVeMc1uaFRU8Y0
 OGK+Uy0mUzgWGkLZzQiK2fjFBoHAituIoIWKZGKH+roHvMRtxuwjHDAQoI/MAssB+uK3y2Fdd2J
 n8S6giYN9O1+VxiKKfTS4LV8f5rG0SBwXtWwd2eZ/bTqbHuu7sMHnsk4Hyx30PhoSON8cNos=
X-Gm-Gg: ASbGncswIgW7lC5G+nBEod2xUnaDuEgbxCPk4/M1uDtyL7WnOd1WLHJXoh0Lkg888MH
 +kDjORj/0c6KXHdCoJI78GZoXFSJBXGThRUCHBesT5vy1QluZr0a5upmVrfoy4VqDVqyVUKHhk5
 htJdhmuEj+eQ8Sdu5vcoLtzmdAVFanJm6RVve6zjz1FLamrRDH+GNiZDa3OHB0fBYh31Xyc6Rna
 9RlwCvFeKTZUlV9OElJKmc/y2/wIzDKIw7u6ijd8e/BJJnawShK6CKnIfpKRmLrM49bVx/NI8I+
 E/3l+gZG//z6hI7beZcvQ1avBOdpZjysMuwo+RIbHK1itHGMW4W/3+5pjMfd6rvgeyb0PpW2Akl
 VZwEmgDatibRjdAQOt1AhURFzOuuUM6AJzqOr1dRaSOyiUElhoc4vvuJWZx25eEkKFLygBswMXR
 DWUL6moZOdGGCC
X-Received: by 2002:ac8:7f84:0:b0:4e8:916f:9716 with SMTP id
 d75a77b69052e-4ede70ace82mr110839561cf.36.1763130406902; 
 Fri, 14 Nov 2025 06:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmQo+aCQCjvCk5e76s4w1boHfDoEoeJkhdDuyaoO1EvXqxjOf/iL1LbyOWdf2SGW30aTGtBw==
X-Received: by 2002:ac8:7f84:0:b0:4e8:916f:9716 with SMTP id
 d75a77b69052e-4ede70ace82mr110838941cf.36.1763130406353; 
 Fri, 14 Nov 2025 06:26:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/4] Add DisplayPort support to QCS615 devicetree
Date: Fri, 14 Nov 2025 16:26:36 +0200
Message-ID: <176312947282.1737000.8802274913506269356.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IaiKmGqa c=1 sm=1 tr=0 ts=69173c27 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=CQcgnb-tr3BYDHGJJJgA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: H-tG7__k77Lu06XOvcEQT4ygXh7KNZez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX3UdAnj6QO7fd
 ckFudZeL/xNV+5d+WRQpoPz79iDU4bjMOl8cqDA2HRUWn/ugfAxm3e8K1dG8SIvExOypLrZ46O/
 mJ2eUr77o4HtL1VJe6CdSI0521E3slaa+h7nm9D/xoD1Vn3SDJjuynv0ceQkTzqzIFWTourQ8La
 9W4oK1IH5lUlwjCe+Inu5WOd2t+3ycTgm9hgXEAXupWbt8oydYhn3TVah2s5OQKc6PbMm1tGutg
 zSuV+7eVEihWHOFGL6tM8QQuB72XZ5F5FaIs/oiG6Q637ZD3yjWeJhvQfVMqSKU+u8CiLicnQf6
 hFqTl8EFKlBLJYnQcxZe8JCqk4JNvA6dRi3xbqJwo0oSz1DYsHE3YQg67Mg+i5lfuzMebx3mdmT
 Z4f36w6XCyw5Eu74SA14h99vOQKD/A==
X-Proofpoint-GUID: H-tG7__k77Lu06XOvcEQT4ygXh7KNZez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116
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

On Tue, 04 Nov 2025 09:33:22 +0800, Xiangxu Yin wrote:
> This series enables DisplayPort functionality on QCS615 platforms.
> It introduces the required bindings, updates SM6150 dtsi for DP controller
> and QMP USB3-DP PHY, and enables DP on the QCS615 Ride board with
> connector and link configuration.
> 
> Depends-on:
> https://lore.kernel.org/all/20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com/
> https://lore.kernel.org/all/20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com/
> 
> [...]

Applied to msm-next, thanks!

[1/4] dt-bindings: display: msm: sm6150-mdss: Add DisplayPort controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a2e6c262a5d3
[2/4] dt-bindings: display: msm: sm6150-mdss: Fix example indentation and OPP values
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5fb24290cb5b

Best regards,
-- 
With best wishes
Dmitry


