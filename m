Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4BBC50B5
	for <lists+freedreno@lfdr.de>; Wed, 08 Oct 2025 14:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451DE10E32A;
	Wed,  8 Oct 2025 12:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9Pi6ndI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372C310E800
 for <freedreno@lists.freedesktop.org>; Wed,  8 Oct 2025 12:57:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Qht001445
 for <freedreno@lists.freedesktop.org>; Wed, 8 Oct 2025 12:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zFb02Y25ke3gxp+QmVEaLQ1A
 ZPsdmeNsL3BSvt29jbs=; b=R9Pi6ndIzcQw/g6FVr/PqDlpIUnX8IvNePJVy5tV
 hcP69WQ80nsUC6IC6+pw1spvPz0gMSNkPQp1hxu0B8mFp7XQLvVu3k3IDFIwTwSs
 tHJv1vYiLieqDvd9EzyRlNkWdy8NZaFG5Nk+LHWc2PX7N/Vz4EytjqdtJUx7QhK7
 KVhePjy0kqS3I4S7ZuVdSs8LQJiMZfkBuynwpKBuQV9fldTR3E/ee/5teEZ130Zh
 tKgk9fkl+poGeF8HeY/CjgldsNdwoDV2zVf6CGdgWl2z/htqOM4Fw2Y54VGghsqD
 Zl2I8m2olY0Kzu7dayEe8SBd/5U88PPFYAof27k9Z7f3PQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy72j58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 12:57:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4db75c7fa8dso197580501cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 05:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759928273; x=1760533073;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zFb02Y25ke3gxp+QmVEaLQ1AZPsdmeNsL3BSvt29jbs=;
 b=hfG7worocuHR2p8Bq5xzl4bYAxUKWtAggRFjQ6y6Gm0SPzdRiHfLkedUHRkASSR2Uk
 8G7T5bSiImZAVYm7bpOwLPKS3GJxTFXhih8dwSbooJchWw7TGGcrkhjWmm+uvRPpy8k7
 PW04ZTRYWmQrquoCZ6gMq9PcNz+TwaHJBGkOaQiADd8644Lpkn6R8kvsd/yurjfszCTx
 MtQ9WHeFDi+P6UN19BBNgUzhbzQITKVRxr56QptDgY/gLmjqkeXqFhUZQ607AZxN/oIo
 W94CfUOVMO2J6lMUrsxMHyOL6Nfi4MfegPp/XOhO4/Nmmd2BQkEw1DFZ3Kn9xSLYvCqa
 uI7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt3QaIoFM1dWJnYLOQVzLt/BRkDflOnUIuipM07p8wLUd8vVCoTdx7tw0/+icMTCZDYpq+r8qa5P0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLC4EsLCr2OOjzaHmPnkKPaTNbP/Ezgh3f33pl3Y92mbWo2Zun
 +C2d0Gpkkaz/3aU3omg7ZjInQCeyQcWbgmBT6uyfLZm8F0O36rpvB4w+p9ckLA1ZB75JgcXrYhp
 n9aiTOIoXbtaDOt2OCgQ2ykMzgIgOeFjalOzLh3pCc0UoW5BGKaya1dqmpHRob6FcuCNUzsI=
X-Gm-Gg: ASbGnct/8tMffnQ0dGxboE8xpPVgDZoWjkmMrWFPn9soN5n005FmNYVStIZl38fFNtp
 Lx38eQdeUwG/myfQw2z6reyYLbOQU553ASox+ssSJN3aob9/35VUchGDF5IHjTL7M5T3U3F7kdl
 YFuEU5FH+DLAQrlflkFMEz5KutXhRSBJqZ3QPklLZ4rDqX8opvn/x9OSMDXsgyJgzi+9XniALmR
 ekJW9PN6P3PjAKJTFmyEEmVy4y0ruo/RcBCUyosT+DY5/1uZHOjmG71B6U0SoqAUTcEaLs4beg2
 1KTZQ6m8Sc29Q6iT2+sAxUyA5C6esG6Md+tkif5MGBzMM0VYIXhWqvynk+XrZ+yxENfxvN2K3OU
 5fYLAC9XCTJO79ch+v81+hbNWZXmeTD4wQi8ut/EaMwVkDqAPl8Uan/DsPg==
X-Received: by 2002:a05:622a:4c1b:b0:4b5:e7c3:1dee with SMTP id
 d75a77b69052e-4e6ead54342mr41671591cf.47.1759928273173; 
 Wed, 08 Oct 2025 05:57:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV/5Su9ZdMKI4CWmNqq4+T6K2gUd3n5lsYdeglyyNSBPSQUQCzIjG40ACDqXMHlfDXvWtfUA==
X-Received: by 2002:a05:622a:4c1b:b0:4b5:e7c3:1dee with SMTP id
 d75a77b69052e-4e6ead54342mr41671141cf.47.1759928272409; 
 Wed, 08 Oct 2025 05:57:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d263sm7204971e87.74.2025.10.08.05.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 05:57:51 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:57:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <5ba7245mhdfa7ni6g4coaktg7fadkznft3s4ogulywwjujbj6i@gddfftavxvwd>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
 <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
 <b14ca601-56d8-4ecc-8813-b9b642646a0c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b14ca601-56d8-4ecc-8813-b9b642646a0c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e65fd2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=UNeRqKPLT5YhSiDNm34A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0vKCBY0uIoOlRyjQY0EaSjoKOKPZ1xXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfXwJv5vbu77Aph
 cZwTy7uCDtGJDojvb2aswwgmYNmgA034y/fiQnixMuJhkgO1SSSukI91xJdN/Hnq0w5O7xOTpj5
 QBiq3fmbINJafW39G8m4tDgcr9rrnxGeL35cTz4wsHqZgBjiL5sv5/f6rubjDFMRHh/aykw2b/k
 xUySShpyRTu7R9v5MP2f29MOhYLl0TwdJizvMigF6kQjP2pLBRiE+Dx+DUylXaJo65bRzyI83BK
 HslWtM0IehbH6TmSPYWC/NMyIsu4soTllK3TJCg+kDMVpnnpqrhUx0cTGY9G/u4EJxSTJ7m3vie
 qNGGi3Ma0jjLFTbV6VZZCzNc3MSduvyugYtxsE9mQcZCmA8/mXEjv16VvD8yB0wHoVbIa6FiBA/
 s2PyQN+81rkZG7MH4a89UniTttKMyA==
X-Proofpoint-ORIG-GUID: 0vKCBY0uIoOlRyjQY0EaSjoKOKPZ1xXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029
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

On Wed, Oct 08, 2025 at 02:50:45PM +0200, Konrad Dybcio wrote:
> On 10/8/25 2:49 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 08, 2025 at 02:40:35PM +0200, Konrad Dybcio wrote:
> >> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> >>> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> >>> with their corresponding PHYs.
> >>>
> >>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +			mdss1_dp0: displayport-controller@22154000 {
> >>> +				compatible = "qcom,sa8775p-dp";
> >>> +
> >>> +				reg = <0x0 0x22154000 0x0 0x104>,
> >>
> >> sz = 0x200
> > 
> > Hmm, why? I think the memory map specifies these sizes.
> 
> Yeah and I went in line with the allocated region size (not last register)

And this goes against the practice used for DP controllers on other
platforms (or other DP controllers on this platform FWIW).

> 
> [...]
> 
> >>>  		dispcc1: clock-controller@22100000 {
> >>> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
> >>>  				 <&rpmhcc RPMH_CXO_CLK>,
> >>>  				 <&rpmhcc RPMH_CXO_CLK_A>,
> >>>  				 <&sleep_clk>,
> >>> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> >>> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
> >>>  				 <0>, <0>, <0>, <0>,
> >>
> >> You need to remove the same amount of zeroes that you added
> > 
> > Nice catch. Which means that somebody was sending untested patches.
> 
> It would work.. until someone tried to add DSI to the second row of zeroes
> instead of the first one

I meant tested against bindings.

-- 
With best wishes
Dmitry
