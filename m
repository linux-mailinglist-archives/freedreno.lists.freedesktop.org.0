Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED698BD301F
	for <lists+freedreno@lfdr.de>; Mon, 13 Oct 2025 14:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF5410E38F;
	Mon, 13 Oct 2025 12:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Irwo3ki0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228A210E38F
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:36:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAVvab012872
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=u8goP0px9a8ckKVRo5TU8/0r
 Gkad5U2lG1RKmUfiwgc=; b=Irwo3ki04+biq4RjeyRHjKxUmrs71JT5Nx4DUy+W
 7s6k94p4fH23o1Ua75eMkZ6so8DtxU5JYsso5BwqxPsVsZTasIPZ6fhJIDYeEWmg
 5q2qmvKgBp3+6pGwLSmGii43JqDalJxDZzt8H7GQ9XbXvOdT+QBsqT5yKxHPqkx1
 9e2VySl9KeHULiWcBfXiwxR4KwU+LnnmglW5c1r319HSfqiwN2spJxjNnim9lGNq
 QCRPrIg3piZ5KqsEtNwF9CcnI+yogY/5PTO1RrxUlcgNbmWCx5MfGp29KvJ/C44U
 rIdSB9y2NHkNhJqZ34hpRvSxCUhcZGVWSSg9msKGNwvgIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bvfr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 12:36:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8574e8993cbso940159885a.1
 for <freedreno@lists.freedesktop.org>; Mon, 13 Oct 2025 05:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760358959; x=1760963759;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u8goP0px9a8ckKVRo5TU8/0rGkad5U2lG1RKmUfiwgc=;
 b=mM88bKuklg0ouUtkH6peWMHDclaNU4eB2jaySSgCHuKhA8HDtJViGPfMFOZCubqUoM
 jyoAqK6wM+UA6bcZ25BUUGZqTTKLW5svSlWjzCjYTFbUjrR84BiQ1dZMswZ5D8sFWtYs
 S0rcydINzdeiCNRB87FhXKW9KrNhgu5mj3A5Xhrhoc8GjnIoZBr2gRJ31EbGvLHivY1b
 ZYj9kN5wCpRJ+oSVitOpN7LpqMLtMfXh5gWlBBDSFT7z/eo4wGlToBMyfm/ax96qe0Pm
 Hi59xDGfbGllrVU5+0RG3a5bXfrW6STqjTyN5ZtIEHgu92QUqdURJS9Tw6DQPFcib4ur
 3o0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHdZrBTTl8RoU2RHETfaIfv/E9+s+xCQ/pDarU9Xpkp5W82SYYP/Pg8cbx787wROW4ei88zcbGrrQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXCRHIJ9LdvW050NctBz9nQW0+++2uvtYxpmdGYtNN9tMzzlAy
 Z8IEbGI76FtWf80KddEM0q4wjPLBoc20iVT4bnaDXnU/ET8FkVKOtTcDkefbmE9lDkcJ/Zet6BH
 oAOVQLiIcTdigPaUYPt8lFSeAC6wSsvGE6Dvs1rNWVS2zw42zQjNX8zyi44Re4uupu6sSVF4=
X-Gm-Gg: ASbGncs/T3CoCCgWQSOrj/IH9aYJh+YlQtU+VsbitogpELoodjJqpssG0O266PiX+PC
 V6diNEdk1aBq8OjOFO+Wq39b+OSSaSjotrggMlV4kFNfsY4UIAo9mLq9PyBGmMtKhjxXqptYNY5
 2A/YutVc0HzIwzK+OFRAeiK4xjGrAWKyilFzXrAOzadOH34yaCkxmc5O+iy4WRdn+EaagTjX3aI
 4O6z6ORIl43YjX4ma2SjG3T3rYt+gFyRmoF/kNcPs8zmirnIsJAA39OfDba1T/NkEh5Q6RRotAf
 l44z0hqLJV/j2Y6FRFS8+J/kA4fQWoZHotUR9fYS2cEY7rtwoIVsuI8MYND9i9U3mqDnlLlOVIN
 RZXmYscW+/PO3IjiAa1JLwyRvedM9R6ulMAuoXdBTse4FFH6z+5Ju
X-Received: by 2002:a05:620a:2983:b0:864:1d18:497e with SMTP id
 af79cd13be357-88354ac39cbmr3044048885a.23.1760358959084; 
 Mon, 13 Oct 2025 05:35:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwoj4faJclOVnlrUN8P7wIZhl4D7mky2VyxsU8g1O5JnX3k9H6mJ7qsn8Lah7rEGjXaxUOBg==
X-Received: by 2002:a05:620a:2983:b0:864:1d18:497e with SMTP id
 af79cd13be357-88354ac39cbmr3044042185a.23.1760358958586; 
 Mon, 13 Oct 2025 05:35:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881e4e4dsm4084850e87.22.2025.10.13.05.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 05:35:57 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:35:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: lemans: Add edp reference clock
 for edp phy
Message-ID: <c4bhkhw6xlaqlwhbataveafav6jcsrgnazk72lkgtj3fygwqjc@4bp5w4q5sygh>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-4-quic_riteshk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-4-quic_riteshk@quicinc.com>
X-Proofpoint-GUID: _Y18qR6UCWpue4eLHjwiqDwxaNsXkOEm
X-Proofpoint-ORIG-GUID: _Y18qR6UCWpue4eLHjwiqDwxaNsXkOEm
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ecf230 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=xNGN3EASD54c2UHPMiwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX/KHZWAFWdJfP
 ZXXaFKvnMt9l9t5wA45m5cceyOmipUIDEuLtneqOQcF3vEGbEAdmzsgil/qWsCy1G1AsHvZxTsk
 BsByLAQtS7NC4T9htsRmQJnRfPNe3KpAPqRmWgNyIha88jcEW1kEhpGsWdV9V4Xb4wo3NFcGET7
 jk1tZsCNA2yUJtukHauR7wuWTyrfE6IiTquANdZxhtyBMm12j0UtHlw59J+BEi9Dxc9/wxBi9xl
 lZxcRCtA745gcdch5CxzHdokPpJGhsJj4LgdWiRvAOC5v0WmRWqfKAeWVa6M756AtuOP0YiI8Hw
 krpeeltqkT47MK1QMYYhNW5AWWlEIFZLyvDLj6IrYljDsP2yXyWQW8oKE4qHNF6u7wWbjZFQARa
 RgjmCcsp8AcTQKTn5a+bXzN1PfNvOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
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

On Mon, Oct 13, 2025 at 04:18:06PM +0530, Ritesh Kumar wrote:
> Add edp reference clock for edp phy on lemans chipset.

eDP, PHY, Fixes:foo bar baz

> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index cf685cb186ed..1bcf1edd9382 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -5034,9 +5034,11 @@
>  				      <0x0 0x0aec2000 0x0 0x1c8>;
>  
>  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> -					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
>  				clock-names = "aux",
> -					      "cfg_ahb";
> +					      "cfg_ahb",
> +					      "ref";
>  
>  				#clock-cells = <1>;
>  				#phy-cells = <0>;
> @@ -5053,9 +5055,11 @@
>  				      <0x0 0x0aec5000 0x0 0x1c8>;
>  
>  				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
> -					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +					 <&gcc GCC_EDP_REF_CLKREF_EN>;
>  				clock-names = "aux",
> -					      "cfg_ahb";
> +					      "cfg_ahb",
> +					      "ref";
>  
>  				#clock-cells = <1>;
>  				#phy-cells = <0>;
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
