Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF17B17D86
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 09:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEE010E7FF;
	Fri,  1 Aug 2025 07:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lOAJYBB9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B10A10E7FD
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 07:30:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5710T2Hh021707
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 07:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DS1d6uuJTVVlh+sODDiMs3u3lzDiNe6wejq9+G3vOk4=; b=lOAJYBB9pHterVsj
 +ihKJGqKSxCW5YyPkxNvkQGi3kDcTPz7tKatNm4V5n4lwg6hygMjP+vckiVf5rv9
 s+JbVp/zW2FPXtuHa4+gQ9vWM4e38dRqZm71mlUNZPTR4rPaXmKK5gSb25ksYxLg
 WzcVqNfjdZ/mm11/cK6AhhkF1aKLUhJ3gQi3YykGj5unIQp9kgObEbGJ+LRyy4rJ
 HxbYcDBav7OQ1RGUeNeqWtPkVp4CXvVfo5YOcWszezu7+ncblgwsjdjRjVAY/j4R
 /7WvToa15rVBapfKmJoa/JH0+PJ1esxntVDuifpBnUUvApAx4zZpYU+6UsZPTqbv
 bZFFLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrk2ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 07:30:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e3452c060eso47252885a.1
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 00:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754033432; x=1754638232;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DS1d6uuJTVVlh+sODDiMs3u3lzDiNe6wejq9+G3vOk4=;
 b=vf/3I3JMPi0C5zxAxPwCIpYbBAuVL83VHKp7dG+m571wnUwN3OZKeRb7KAMjXVWRdj
 mz0QCza61xxalBV4UPAbC6Yr7FzizQ4EmD/Ee3pFONGKVeQM8um1SfQvLQxbHZIVwgO3
 hiSldZ6YfuzTJkQa/hVcn8ybGaYcArKpHM3PwcJnDZfolBfHirpO5dv7d62/+iqK9qY0
 CCkyJwvfVQEasAMn0KSxIJA/BYnPYKMoZ7HJby6UZtKT3Jl0U27cHB85lv2Q7fPAt8mt
 gxyj/PyIfyUUAqbbr4wUSTCh3CpHTkQo0hoQR4faufUraJjpp4w4dwGb1v8eieCxGo3K
 TC6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7njlsyztpv6j+GP1sBC7bcc72JVBmi7mfcHqjUVnpuGnPNpI3tzYtS8Z3ZpAF/5HydnukctGQI64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKKvcHM8KDp1Tz5fMoskV52lBtqKaY8Ub5xvsJqGy4Lf/UiwU1
 Y1olY8StNWaJsb1NfXrTrwMiBJjhs8+1gDb1PvkqhrWl7R2qNS9eF3zyq0TphUNT7RdZ7uVBops
 wYUlfP+5rg6YNu99k3kMS0TfAkPyeWQlZ0iEzjy0XX6nkUABMN+Vgpzqcxkv3vg4S4Aftv6c=
X-Gm-Gg: ASbGncsVcqcm3SDX+N9O4rDEY1nIJNuedYvnWXuazRatonnU+I0oG7YD0QCDCQTp4+4
 Pm95HhvXS7fill0XbAz6i8T3js+t8MCQweD6+d2Up+wsyWdbjxlV3lmLpgNcDQEt0cshZdovfW1
 ubQCSbQQWCPuv86FSx9AWgrhA4BhJwf3r4nZR3YB75xGe0/otCm/oK2TeczXcUMXan8xZY3u8bk
 9Kh6vCsrPJhpP9suIBLOlt5ED3GeN861NZHssHrxsJMPbCqN5/m497nDX2VM4AJp6lmg0WOdSpO
 7A/2jiyXIhmQes48eXNbVCkxZeba7g2q41+LYbADxKnR+ZTmuZYkM0EfxPOcRYtMA/xL5eu63Hy
 nP+qcW+tRJJ0eB4TkOMNoh80yZPS1I0oDl6cQEcTIiZMa6LDjc0FR
X-Received: by 2002:a05:620a:2584:b0:7e6:67c2:a95b with SMTP id
 af79cd13be357-7e66f3b4567mr1356787385a.51.1754033431945; 
 Fri, 01 Aug 2025 00:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQuekGzv0jTOloZYm8zH/eCq5x2X1Bb4QDXyOYS+z3nUEHpAUxNETANKjB+YB8wrtb6aK+Og==
X-Received: by 2002:a05:620a:2584:b0:7e6:67c2:a95b with SMTP id
 af79cd13be357-7e66f3b4567mr1356780185a.51.1754033431109; 
 Fri, 01 Aug 2025 00:30:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88caf6dcsm491610e87.159.2025.08.01.00.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 00:30:30 -0700 (PDT)
Date: Fri, 1 Aug 2025 10:30:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 konrad.dybcio@oss.qualcomm.com, fange.zhang@oss.qualcomm.com,
 quic_lliu6@quicinc.com, quic_yongmou@quicinc.com
Subject: Re: [PATCH v2 02/13] dt-bindings: phy: Add binding for QCS615
 standalone QMP DP PHY
Message-ID: <x4ozwgcti2vrgorgow6nttcjmduk5e4kkd3pjj6xfsgihk6u4n@klfpypor6ya6>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-2-42b4037171f8@oss.qualcomm.com>
 <jemfu5sy7k4a2iar55im5bhyhxzlrwpftmpqmps3b2tco7r6a2@oodls7gi45yy>
 <e673a3a3-6924-49db-9040-e34b82199a43@oss.qualcomm.com>
 <w3rwao5wbmstdyics6qhp7beulbbp5ludqkwpfsmevgqmzz3d6@u2e533zlitkr>
 <e5a3f05f-9775-4e3d-ae7d-ebbca14b4df5@oss.qualcomm.com>
 <ffdvzupefzhqq7fqtloycc3xzu57i55ths73xcjftor2cifuzr@5vhq2hfmkvda>
 <bd8f8643-a8c8-43d7-b293-acdba5ff798a@oss.qualcomm.com>
 <ad4f53eb-2f4b-4e62-a162-461de431e3de@oss.qualcomm.com>
 <2de51bf2-baed-4bf9-a40c-1681b2efcf79@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2de51bf2-baed-4bf9-a40c-1681b2efcf79@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA1MyBTYWx0ZWRfX+txcHAmJHrt4
 8Oe/qS1SC+yg3qcYQvvtbmDXWu5YIGJxT/NkdLdDCMCH91t7Qyr8QaAZOuv0Ty7jU66HQlVWHc4
 YzsSnUEi5KsMOzkqlEJUR/z0jlgzSEgMLU29exP77kNy1imCX6aEY+qOgiTH77An+Gly8Ywiw3a
 sLOqRapK1+8jyamBmXENPPfpR/rMdA70RMRqikmdLSXWe6jnGHULwD6ZyGOFdpNE3d8aESEzGLi
 liTwVXNBt0gMhPZJvlcOLY9J2a9CvW/UWSFB52zbE4r7HXlp5KfZRRv2MXfvfTRmxlucpxv1PfW
 S+EtSxlYYlQHWRLnpOBZlLEIDCBdzhjncmi+yfk2krtNy4MqvBZUIaf1/wEfwKtvdUlJGbB2I3/
 7c4tHjVxrSnOJBLuTLzO5TC4fxGiEB9rdhumscfhp/1KvPFMxiJdTygyYVeQzwe3MfYgQw0C
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688c6d19 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=Oh2cFVv5AAAA:8 a=OU9VWU6s7H6VDRzcY4UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: 4UsmlItU6VmIaW7q6AOMEbceLs435rCj
X-Proofpoint-ORIG-GUID: 4UsmlItU6VmIaW7q6AOMEbceLs435rCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010053
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

On Fri, Aug 01, 2025 at 11:57:50AM +0800, Xiangxu Yin wrote:
> 
> On 8/1/2025 1:13 AM, Dmitry Baryshkov wrote:
> > On 31/07/2025 08:06, Xiangxu Yin wrote:
> >>
> >> On 7/31/2025 2:35 AM, Dmitry Baryshkov wrote:
> >>> On Wed, Jul 30, 2025 at 04:53:16PM +0800, Xiangxu Yin wrote:
> >>>> On 7/22/2025 8:41 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, Jul 22, 2025 at 08:05:06PM +0800, Xiangxu Yin wrote:
> >>>>>> On 7/22/2025 4:38 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, Jul 22, 2025 at 03:22:03PM +0800, Xiangxu Yin wrote:
> >>>>>>>> Introduce device tree binding documentation for the Qualcomm QMP DP PHY
> >>>>>>>> on QCS615 SoCs. This PHY supports DisplayPort functionality and is
> >>>>>>>> designed to operate independently from the USB3 PHY.
> >>>>>>>>
> >>>>>>>> Unlike combo PHYs found on other platforms, the QCS615 DP PHY is
> >>>>>>>> standalone and does not support USB/DP multiplexing. The binding
> >>>>>>>> describes the required clocks, resets, TCSR configuration, and clock/PHY
> >>>>>>>> cells for proper integration.
> >>>>>>> Simply put: no, this is not correct. Even if you go to the SM6150 block
> >>>>>>> diagram, it points out that DP uses the USB3 PHY, not a separate DP PHY.
> >>>>>>>
> >>>>>>> I thought that we have discussed it beforehand.
> >>>>>>>
> >>>>>>> I can quote my comment from the previous thread:
> >>>>>>>
> >>>>>>>>> No. It means replacing extending existing entries with bigger reg and
> >>>>>>>>> #phy-cells = <1>. The driver must keep working with old node definitions
> >>>>>>>>> as is to ensure backwards compatibility. New nodes should make it
> >>>>>>>>> register two PHYs (USB3 and DP). On the driver side modify generic code
> >>>>>>>>> paths, all platforms supported by the driver should be able to support
> >>>>>>>>> USB3+DP combination.
> >>>>>>> Looking at the hardware memory maps:
> >>>>>>>
> >>>>>>> MSM8998: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> >>>>>>> SDM660: USB3 PHY regs at 0xc010000, DP PHY regs at 0xc011000
> >>>>>>> QCM2290: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
> >>>>>>> SM6115: USB3 PHY regs at 0x1615000, DP PHY regs at 0x1616000
> >>>>>>>
> >>>>>>> Now:
> >>>>>>> SM6150: USB3 PHY regs at 0x88e6000
> >>>>>>>          USB3 PHY regs at 0x88e8000, DP PHY regs at 0x88e9000
> >>>>>>>
> >>>>>>> I do not know, why msm-4.14 didn't describe second USB3 PHY. Maybe you
> >>>>>>> can comment on it.
> >>>>>>>
> >>>>>>> But based on that list, the only special case that we need to handle is
> >>>>>>> the first USB3 PHY, which doesn't have a corresponding DP PHY block. But
> >>>>>>> it will be handled anyway by the code that implements support for the
> >>>>>>> existing DT entries. All other hardware blocks are combo USB+DP PHYs.
> >>>>>>>
> >>>>>>> Having all of that in mind, please, for v3 patchset implement USB+DP
> >>>>>>> support in the phy-qcom-qmp-usbc driver and add the following logic
> >>>>>>> that also was requested in v1 review:
> >>>>>>>
> >>>>>>>>> Not quite. Both USB3 and DP drivers should be calling power_on / _off.
> >>>>>>>>> If USB3 is on, powering on DP PHY should fail. Vice versa, if DP is on,
> >>>>>>>>> powering on USB should fail.
> >>>>>>> I think our understanding might not be fully aligned.
> >>>>> I did not write this. Please fix your mailer to quote messages properly.
> >>>>> As you are using Thunderbird, I'm not sure where the issue comes from.
> >>>>>
> >>>>> Also please fix it to wrap your responses somwhere logically.
> >>>>>
> >>>>>>> Perhaps this is because I didn’t accurately update the mutual exclusion relationships and test results for the different PHYs.
> >>>>>>> Let me clarify my latest findings and explain why I believe these are separate PHYs that require mutual exclusion via TCSR.
> >>>>>>>
> >>>>>>> 1. About the TCSR DP_PHYMODE Registers
> >>>>>>>
> >>>>>>> MSM8998/SDM660:
> >>>>>>>     Only one TCSR_USB3_DP_PHYMODE register at 0x1FCB248.
> >>>>>>> QCM2290/SM6115:
> >>>>>>>     TCSR_USB3_0_DP_PHYMODE at 0x3CB248
> >>>>>>>     TCSR_USB3_1_DP_PHYMODE at 0x3CB24C
> >>>>>>> SM6150:
> >>>>>>>     TCSR_USB3_0_DP_PHYMODE at 0x1FCB248
> >>>>>>>     TCSR_USB3_1_DP_PHYMODE at 0x1FCB24C
> >>>>> SM6150 has two different sets of output pins, so the first register
> >>>>> covers first set of SS lanes (which are routed to the documented SS
> >>>>> PHY), the second register covers the second set of SS lanes (which are
> >>>>> routed to the DP and secondary USB PHY).
> >>>>>
> >>>>> I can only assume that the same configuration was supposed to be
> >>>>> applicable to QCM2290 / SM6115, but was later removed / disabled, while
> >>>>> the registers were kept in the TCSR block.
> >>>>>
> >>>>>>> Even though MSM8998, SDM660, QCM2290, and SM6115 all have one USB3 PHY and one DP PHY, the TCSR DP_PHYMODE register configuration is different on each platform.
> >>>>>>>
> >>>>>>> Additionally, I found some interesting register documentation for QCM2290/SM6115:
> >>>>>>>     TCSR_USB3_0_DP_PHYMODE: “In kamorta this one is for mobile usb. DP not supported.”
> >>>>>>>     TCSR_USB3_1_DP_PHYMODE: “DP mode supported for Auto usb in kamorta.”
> >>>>>>> I think the reason for having two different TCSR registers is to allow both the USB3.0 and DP PHYs to be useds at the same time in certain product configurations.
> >>>>> Sure. One for the first PHY (USB), one for the second PHY (USB+DP).
> >>>>> If you check the memory map, you will find the second VLS CLAMP register
> >>>>> for the second USB PHY.
> >>>>>
> >>>>>>> 2. SM6150 Test Results
> >>>>>>> When TCSR_DP_PHYMODE_0 is switched to DP, the USB3 primary PHY cannot work, and the DP PHY is also not functional (possibly due to clock lack or other configuration mismatch with this TCSR setting).
> >>>>>>> When TCSR_DP_PHYMODE_1 is switched to DP, both the USB3 primary PHY and the DP PHY work normally.
> >>>>>>> I think "why msm-4.14 didn't describe second USB3 PHY", because TCSR_DP_PHYMODE_1 always works in DP mode.
> >>>>>>> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c
> >>>>> Here it still programs the TCSR register.
> >>>>>
> >>>>>>> Based on these info, I believe these are separate PHYs, and only the
> >>>>>>> TCSR DP_PHYMODE registers determine which USB3/DP PHYs are paired or
> >>>>>>> mutually exclusive. This is why I have maintained separate private
> >>>>>>> data for each PHY and implemented Power on mutex control via TCSR,
> >>>>>>> rather than using a qmp_combo-like structure.
> >>>>> Still, no. Check the block diagram of SM6150.
> >>>>>
> >>>>>>> Given the above, do you think we still need to force USB and DP to be strictly bound together like a combo PHY?
> >>>>> Yes.
> >>>> I checked the related PHY series and block diagrams again.
> >>>>
> >>>> PRI and SEC go to different nodes based on the SoC design, and there are two types of configurations: USB3-only and USB3+DP pairing.
> >>>>
> >>>> Before proceed the v3 patchset, I’d like to double-confirm whether the following structure is what you expect:
> >>>>
> >>>> usb_qmpphy_1: phy@88e6000 {
> >>>>      compatible = "qcom,sm6150-qmp-usb3-prim-phy"; <== rename to PRIM
> >>> No, we already have a compatible name and DT schema for this device.
> >> Then current compatible name is "qcom,qcs615-qmp-usb3-phy" and shall we need update to "qcom,sm6150-qmp-usb3-phy"?
> >
> > Why? You _already_ have a compatible string. You don't need to change it just to follow the SoC name. 
> >
> Ok, but just to confirm — in this case, the USB3-DP PHY would use "qcom,sm6150-qmp-usb3-dp-phy" while the USB3-only PHY still uses "qcom,qcs615-qmp-usb3-phy"?
> 
> Since both PHYs are on the same SoC, would it make sense to keep the naming consistent and use "qcom,qcs615-..." for both? 

Either way is fine with me.

> 

-- 
With best wishes
Dmitry
