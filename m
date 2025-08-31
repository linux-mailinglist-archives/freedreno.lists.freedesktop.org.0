Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C10B3D1C5
	for <lists+freedreno@lfdr.de>; Sun, 31 Aug 2025 12:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E70F10E2CE;
	Sun, 31 Aug 2025 10:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kg/QekD6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF96210E2CE
 for <freedreno@lists.freedesktop.org>; Sun, 31 Aug 2025 10:00:30 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57V5bENk012476
 for <freedreno@lists.freedesktop.org>; Sun, 31 Aug 2025 10:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qD5oRl6PaN2DjJNUuUSysf512mj6mjwHEypDav6WIT4=; b=kg/QekD6M8g46WOp
 Ex/OpvguNct1GPmddlTPxc0VbSNcgUL1OUGaOQ1UKSspO/dLtVwW27H/oIQFn0oV
 3iTHam2elpP1qaggWIkGaiYRcp29t3jX47YAHmk3vpb2SRYg1KbfOfapGsjlwb92
 M26mbUsLRojMQH/Wx1BSKqOzCIAY01SJ0uxlEljF22YI6NR/OLvNYJauNst8LZbZ
 6AagqSqgaFZlj//rR+CFLVXbgO+rfVMZYyUatbWIZQUfOR0sLrP6gx4bHx+TXn1u
 5bBD0RDjnMkbJp+8io56Mqf2ca0A/wSizlD0UgeaXuqmDr13lziooGXMS45bv1IO
 le1Wuw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp22h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 31 Aug 2025 10:00:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b32d323297so5810981cf.1
 for <freedreno@lists.freedesktop.org>; Sun, 31 Aug 2025 03:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756634428; x=1757239228;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qD5oRl6PaN2DjJNUuUSysf512mj6mjwHEypDav6WIT4=;
 b=dxXNNIp4rO1U0I3PqUfs5x6YawJtHpz1WVXoAvog/6byclZ0ZYvTMiz/ySm2aGh7DI
 1pSdDJcLXknOoaH09w6XhWdNvBLBFb81o4oYEX6h2MEuuXXV+mlvQjVJwM7lO0aWWIDG
 G05bm4m2U1h7pFcWRNS6ZD9fO2FXZeu6sruusDXBYGfOCe6LvyOHZ/r4Fq96PG+A3p4D
 lH6SutUOobnre6GfgJeyHTFNbu6gc9RPA7AY+iy7QOL1OSr0bCvb7ycvBAufvsO9J3gF
 nX9K2Dtl0oLdsBKrTD4WmkebKMMQsBSPj5TXXlaEmwCT1eHlg76HU4SKZT2tDLMiunvA
 ZqDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMD/gReqNRS7Sa5MVguXxl794HyzWv6mYhF0NcrXFSM6l81msNBmpc86m8Vq935FPCItQEI9G6jzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdR2u+23yQiaIwZhpNrOmm2vqe0sFOWwq8jMZiznD2frjT44l0
 6nNDMeoTMapW9QGVn44gqlIXgAMnOD8Y04bUtiFeYFijF4wNqxhuv+mErEdjgrUm/3mGyJMPgED
 pPWNlYDz2eKiQr3gQvnJBq+KHI3IioxcbrKz3sq0RTb0Xg6Ef83N4tFkgF3MN2OLPuLTsIwA=
X-Gm-Gg: ASbGncspXgKibH+nHSrkdtUFzeLX6xt8G9ElKgNvUXUS390p8qctZEpgxSCNYYLNuFI
 B3z7/vUVdDvtkEln0fvaatUITOVmn59bLMVweKATRBz1uxXae0HBgxbc52FAoZSEHXgXmKf8rd5
 zpiabdNbzHl3TyFe8vw7sS+QrkTLcgaBYOAU9SI2nRiV31Zxpr2P3pfnq1adsgVBuHt8VAXfW1R
 ZaqihatwEl55G+O7D+8X8CFPIfimBNZYqji+VAAVRu/aXdzN0RjKPoZt4x9kOCbUwGHx+XJ8Y6A
 RDxEauiTfjbjRoMkzu4EYFx8WmYcTF7q0/BAhuHdHGAJAy+FFmsfrddESurwxF+98l5d8GFW64b
 /C5bUaP0ZcqisujY1POeWmfY99VCB9hIxpEi9pM4jKWG2LIt9KpAs
X-Received: by 2002:a05:622a:1812:b0:4b2:94e5:9847 with SMTP id
 d75a77b69052e-4b31dcac538mr59712631cf.74.1756634428114; 
 Sun, 31 Aug 2025 03:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFpiHqGgSFYOFPDu7JwQJBWckE87BwsT8u/A9LiwCj49Zah2l6SdAxeMKGdwGN9bMfC2Cr/A==
X-Received: by 2002:a05:622a:1812:b0:4b2:94e5:9847 with SMTP id
 d75a77b69052e-4b31dcac538mr59711811cf.74.1756634427339; 
 Sun, 31 Aug 2025 03:00:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f79801b2csm257066e87.117.2025.08.31.03.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 03:00:26 -0700 (PDT)
Date: Sun, 31 Aug 2025 13:00:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Adam Skladowski <a_skl39@protonmail.com>,
 Sireesh Kodali <sireeshkodali@protonmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Dang Huynh <danct12@riseup.net>
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: Add initial support for MSM8937
Message-ID: <fv4jz6unxpncqazgptet4ie67vdrqqnq3owpjuh7huqvepoozd@yelivqgci2om>
References: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
 <20250831-msm8937-v7-4-232a9fb19ab7@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250831-msm8937-v7-4-232a9fb19ab7@mainlining.org>
X-Proofpoint-GUID: PTEkMfKjvZzYYfufyZ9HaAaIY1YSI0V2
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b41d3d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8 a=BfrjIcddtau6jJL3F9YA:9
 a=r_sqX3LX-aZnKoI4:21 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: PTEkMfKjvZzYYfufyZ9HaAaIY1YSI0V2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX/SWTUywiyDAL
 voX/WdnIc+rsqXYNhcO0Eho9jRyKdh3mGffPgFkPQ6hN8aMP60aPXovWvuzred9tzNv9mZn9DGU
 6R2MaUGk1I0qoq2XAhd7HBvmiKirt5OZADnHJ9Qg+CKc96KTz/YHPz/zzRrPmn0PdZMI88O/LAA
 YmGGGfGFPO88HXjlZgWIc6rbzVxXySLCj7TIAT+L36RewKueKuu8MKj4DfJvo9Ei+jwVhn3BAH1
 yG9vDCTBR8jHOlT0DLbZoAuzWmYzdxTJyUOAc5yX2+j/LRzOPbRTSxngjyJu+JfGdDlkwtW2mQ8
 4pa8/a2Hd7VZaaz2fvh2kHXiYxXQW0lg88y8r90LVHiMmX9RL4Cs199Gqiri0xw5wOjef5s2J5Z
 WpgtReBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-31_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

On Sun, Aug 31, 2025 at 12:38:16AM +0200, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 2134 +++++++++++++++++++++++++++++++++
>  1 file changed, 2134 insertions(+)

> +	};
> +
> +
> +	firmware {
> +		scm: scm {
> +			compatible = "qcom,scm-msm8916", "qcom,scm";

"qcom,scm-msm8937", "qcom,scm"

> +			clocks = <&gcc GCC_CRYPTO_CLK>,
> +				 <&gcc GCC_CRYPTO_AXI_CLK>,
> +				 <&gcc GCC_CRYPTO_AHB_CLK>;
> +			clock-names = "core",
> +				      "bus",
> +				      "iface";
> +			#reset-cells = <1>;
> +
> +			qcom,dload-mode = <&tcsr 0x6100>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		/* We expect the bootloader to fill in the reg */
> +		reg = <0 0x80000000 0 0>;
> +		device_type = "memory";
> +	};
> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		qseecom_mem: reserved@85b00000 {
> +			reg = <0x0 0x85b00000 0x0 0x800000>;
> +			no-map;
> +		};
> +
> +		smem@86300000 {
> +			compatible = "qcom,smem";
> +			reg = <0x0 0x86300000 0x0 0x100000>;
> +			no-map;
> +
> +			hwlocks = <&tcsr_mutex 3>;
> +			qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +		};
> +
> +		reserved@86400000 {
> +			reg = <0x0 0x86400000 0x0 0x400000>;
> +			no-map;
> +		};
> +
> +		rmtfs@92100000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0x0 0x92100000 0x0 0x180000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +		};
> +
> +		adsp_mem: adsp {
> +			size = <0x0 0x1100000>;
> +			alignment = <0x0 0x100000>;
> +			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
> +			no-map;
> +			status = "disabled";
> +		};
> +
> +		mba_mem: mba {
> +			size = <0x0 0x100000>;
> +			alignment = <0x0 0x100000>;
> +			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
> +			no-map;
> +			status = "disabled";
> +		};
> +
> +		wcnss_mem: wcnss {
> +			size = <0x0 0x700000>;
> +			alignment = <0x0 0x100000>;
> +			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
> +			no-map;
> +			status = "disabled";
> +		};
> +
> +		venus_mem: venus {
> +			size = <0x0 0x400000>;
> +			alignment = <0x0 0x100000>;
> +			alloc-ranges = <0x0 0x86800000 0x0 0x8000000>;
> +			no-map;
> +			status = "disabled";
> +		};
> +	};
> +
> +	cpu_opp_table_c0: opp-table-c0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-768000000 {
> +			opp-hz = /bits/ 64 <768000000>;
> +		};
> +
> +		opp-902400000 {
> +			opp-hz = /bits/ 64 <902400000>;
> +		};
> +
> +		opp-998400000 {
> +			opp-hz = /bits/ 64 <998400000>;
> +		};
> +
> +		opp-1094400000 {
> +			opp-hz = /bits/ 64 <1094400000>;
> +		};
> +	};
> +
> +	cpu_opp_table_c1: opp-table-c1 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-960000000 {
> +			opp-hz = /bits/ 64 <960000000>;
> +		};
> +
> +		opp-1094400000 {
> +			opp-hz = /bits/ 64 <1094400000>;
> +		};
> +
> +		opp-1209600000 {
> +			opp-hz = /bits/ 64 <1209600000>;
> +		};
> +
> +		opp-1248000000 {
> +			opp-hz = /bits/ 64 <1248000000>;
> +		};
> +
> +		opp-1344000000 {
> +			opp-hz = /bits/ 64 <1344000000>;
> +		};
> +
> +		opp-1401600000 {
> +			opp-hz = /bits/ 64 <1401600000>;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	rpm: remoteproc {
> +		compatible = "qcom,msm8937-rpm-proc", "qcom,rpm-proc";
> +
> +		smd-edge {
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +			qcom,ipc = <&apcs1 8 0>;
> +			qcom,smd-edge = <15>;
> +
> +			rpm_requests: rpm-requests {
> +				compatible = "qcom,rpm-msm8937", "qcom,smd-rpm";
> +				qcom,smd-channels = "rpm_requests";
> +
> +				rpmcc: clock-controller {
> +					compatible = "qcom,rpmcc-msm8937", "qcom,rpmcc";
> +					#clock-cells = <1>;
> +					clocks = <&xo_board>;
> +					clock-names = "xo";
> +				};
> +
> +				rpmpd: power-controller {
> +					compatible = "qcom,msm8937-rpmpd", "qcom,msm8917-rpmpd";
> +					#power-domain-cells = <1>;
> +					operating-points-v2 = <&rpmpd_opp_table>;
> +
> +					rpmpd_opp_table: opp-table {
> +						compatible = "operating-points-v2";
> +
> +						rpmpd_opp_ret: opp1 {
> +							opp-level = <RPM_SMD_LEVEL_RETENTION>;
> +						};
> +
> +						rpmpd_opp_ret_plus: opp2 {
> +							opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
> +						};
> +
> +						rpmpd_opp_min_svs: opp3 {
> +							opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
> +						};
> +
> +						rpmpd_opp_low_svs: opp4 {
> +							opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
> +						};
> +
> +						rpmpd_opp_svs: opp5 {
> +							opp-level = <RPM_SMD_LEVEL_SVS>;
> +						};
> +
> +						rpmpd_opp_svs_plus: opp6 {
> +							opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
> +						};
> +
> +						rpmpd_opp_nom: opp7 {
> +							opp-level = <RPM_SMD_LEVEL_NOM>;
> +						};
> +
> +						rpmpd_opp_nom_plus: opp8 {
> +							opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
> +						};
> +
> +						rpmpd_opp_turbo: opp9 {
> +							opp-level = <RPM_SMD_LEVEL_TURBO>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	smp2p-adsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <443>, <429>;
> +
> +		interrupts = <GIC_SPI 291 IRQ_TYPE_EDGE_RISING>;
> +
> +		mboxes = <&apcs1 10>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <2>;
> +
> +		adsp_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		adsp_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	smp2p-modem {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <435>, <428>;
> +
> +		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
> +
> +		mboxes = <&apcs1 14>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <1>;
> +
> +		modem_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		modem_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	smp2p-wcnss {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <451>, <431>;
> +
> +		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
> +
> +		mboxes = <&apcs1 18>;
> +
> +		qcom,local-pid = <0>;
> +		qcom,remote-pid = <4>;
> +
> +		wcnss_smp2p_out: master-kernel {
> +			qcom,entry-name = "master-kernel";
> +
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		wcnss_smp2p_in: slave-kernel {
> +			qcom,entry-name = "slave-kernel";
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	smsm {
> +		compatible = "qcom,smsm";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		mboxes = <0>, <&apcs1 13>, <0>, <&apcs1 19>;
> +
> +		apps_smsm: apps@0 {
> +			reg = <0>;
> +
> +			#qcom,smem-state-cells = <1>;
> +		};
> +
> +		hexagon_smsm: hexagon@1 {
> +			reg = <1>;
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		wcnss_smsm: wcnss@6 {
> +			reg = <6>;
> +			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		ranges = <0 0 0 0xffffffff>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		qfprom: qfprom@a4000 {
> +			compatible = "qcom,msm8937-qfprom", "qcom,qfprom";
> +			reg = <0x000a4000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			tsens_base1: base1@1d8 {
> +				reg = <0x1d8 0x1>;
> +				bits = <0 8>;
> +			};
> +
> +			tsens_s5_p1: s5-p1@1d9 {
> +				reg = <0x1d9 0x1>;
> +				bits = <0 6>;
> +			};
> +
> +			tsens_s5_p2: s5-p2@1d9 {
> +				reg = <0x1d9 0x2>;
> +				bits = <6 6>;
> +			};
> +
> +			tsens_s6_p1: s6-p1@1da {
> +				reg = <0x1da 0x2>;
> +				bits = <4 6>;
> +			};
> +
> +			tsens_s6_p2: s6-p2@1db {
> +				reg = <0x1db 0x1>;
> +				bits = <2 6>;
> +			};
> +
> +			tsens_s7_p1: s7-p1@1dc {
> +				reg = <0x1dc 0x1>;
> +				bits = <0 6>;
> +			};
> +
> +			tsens_s7_p2: s7-p2@1dc {
> +				reg = <0x1dc 0x2>;
> +				bits = <6 6>;
> +			};
> +
> +			tsens_s8_p1: s8-p1@1dd {
> +				reg = <0x1dd 0x2>;
> +				bits = <4 6>;
> +			};
> +
> +			tsens_s8_p2: s8-p2@1de {
> +				reg = <0x1de 0x1>;
> +				bits = <2 6>;
> +			};
> +
> +			tsens_base2: base2@1df {
> +				reg = <0x1df 0x1>;
> +				bits = <0 8>;
> +			};
> +
> +			tsens_mode: mode@210 {
> +				reg = <0x210 0x1>;
> +				bits = <0 3>;
> +			};
> +
> +			tsens_s0_p1: s0-p1@210 {
> +				reg = <0x210 0x2>;
> +				bits = <3 6>;
> +			};
> +
> +			tsens_s0_p2: s0-p2@211 {
> +				reg = <0x211 0x1>;
> +				bits = <1 6>;
> +			};
> +
> +			tsens_s1_p1: s1-p1@211 {
> +				reg = <0x211 0x2>;
> +				bits = <7 6>;
> +			};
> +
> +			tsens_s1_p2: s1-p2@212 {
> +				reg = <0x212 0x2>;
> +				bits = <5 6>;
> +			};
> +
> +			tsens_s2_p1: s2-p1@213 {
> +				reg = <0x213 0x2>;
> +				bits = <3 6>;
> +			};
> +
> +			tsens_s2_p2: s2-p2@214 {
> +				reg = <0x214 0x1>;
> +				bits = <1 6>;
> +			};
> +
> +			tsens_s3_p1: s3-p1@214 {
> +				reg = <0x214 0x2>;
> +				bits = <7 6>;
> +			};
> +
> +			tsens_s3_p2: s3-p2@215 {
> +				reg = <0x215 0x2>;
> +				bits = <5 6>;
> +			};
> +
> +			tsens_s4_p1: s4-p1@216 {
> +				reg = <0x216 0x2>;
> +				bits = <3 6>;
> +			};
> +
> +			tsens_s4_p2: s4-p2@217 {
> +				reg = <0x217 0x1>;
> +				bits = <1 6>;
> +			};
> +
> +			tsens_s9_p1: s9-p1@230 {
> +				reg = <0x230 0x1>;
> +				bits = <0 6>;
> +			};
> +
> +			tsens_s9_p2: s9-p2@230 {
> +				reg = <0x230 0x2>;
> +				bits = <6 6>;
> +			};
> +
> +			tsens_s10_p1: s10-p1@231 {
> +				reg = <0x231 0x2>;
> +				bits = <4 6>;
> +			};
> +
> +			tsens_s10_p2: s10-p2@232 {
> +				reg = <0x232 0x1>;
> +				bits = <2 6>;
> +			};
> +
> +			gpu_speed_bin: gpu-speed-bin@601b {
> +				reg = <0x601b 0x1>;
> +				bits = <7 1>;
> +			};
> +		};
> +
> +		usb_hs_phy: phy@6c000 {
> +			compatible = "qcom,usb-hs-28nm-femtophy";
> +			reg = <0x0006c000 0x200>;
> +			#phy-cells = <0>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&gcc GCC_USB_HS_PHY_CFG_AHB_CLK>,
> +				 <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
> +			clock-names = "ref",
> +				      "ahb",
> +				      "sleep";
> +			resets = <&gcc GCC_QUSB2_PHY_BCR>,
> +				 <&gcc GCC_USB2_HS_PHY_ONLY_BCR>;
> +			reset-names = "phy",
> +				      "por";
> +			status = "disabled";
> +		};
> +
> +		rng@e3000 {
> +			compatible = "qcom,prng";
> +			reg = <0x000e3000 0x1000>;
> +			clocks = <&gcc GCC_PRNG_AHB_CLK>;
> +			clock-names = "core";
> +		};
> +
> +		tsens: thermal-sensor@4a9000 {
> +			compatible = "qcom,msm8937-tsens", "qcom,tsens-v1";
> +			reg = <0x004a9000 0x1000>,
> +			      <0x004a8000 0x1000>;
> +			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow";
> +			nvmem-cells = <&tsens_mode>,
> +				      <&tsens_base1>, <&tsens_base2>,
> +				      <&tsens_s0_p1>, <&tsens_s0_p2>,
> +				      <&tsens_s1_p1>, <&tsens_s1_p2>,
> +				      <&tsens_s2_p1>, <&tsens_s2_p2>,
> +				      <&tsens_s3_p1>, <&tsens_s3_p2>,
> +				      <&tsens_s4_p1>, <&tsens_s4_p2>,
> +				      <&tsens_s5_p1>, <&tsens_s5_p2>,
> +				      <&tsens_s6_p1>, <&tsens_s6_p2>,
> +				      <&tsens_s7_p1>, <&tsens_s7_p2>,
> +				      <&tsens_s8_p1>, <&tsens_s8_p2>,
> +				      <&tsens_s9_p1>, <&tsens_s9_p2>,
> +				      <&tsens_s10_p1>, <&tsens_s10_p2>;
> +			nvmem-cell-names = "mode",
> +					   "base1", "base2",
> +					   "s0_p1", "s0_p2",
> +					   "s1_p1", "s1_p2",
> +					   "s2_p1", "s2_p2",
> +					   "s3_p1", "s3_p2",
> +					   "s4_p1", "s4_p2",
> +					   "s5_p1", "s5_p2",
> +					   "s6_p1", "s6_p2",
> +					   "s7_p1", "s7_p2",
> +					   "s8_p1", "s8_p2",
> +					   "s9_p1", "s9_p2",
> +					   "s10_p1", "s10_p2";
> +			#qcom,sensors = <11>;
> +			#thermal-sensor-cells = <1>;
> +		};
> +
> +		rpm_msg_ram: sram@60000 {

This node is wrongly placed.

> +			compatible = "qcom,rpm-msg-ram";
> +			reg = <0x00060000 0x8000>;
> +		};
> +
> +		restart@4ab000 {
> +			compatible = "qcom,pshold";
> +			reg = <0x004ab000 0x4>;
> +		};
> +

-- 
With best wishes
Dmitry
