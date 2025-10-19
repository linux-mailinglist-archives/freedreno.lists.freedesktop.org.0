Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D37BEE3F4
	for <lists+freedreno@lfdr.de>; Sun, 19 Oct 2025 13:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A2110E151;
	Sun, 19 Oct 2025 11:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZG6XlRve";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8CC10E151
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 11:52:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JBJsG8016582
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 11:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=TN7+hMpDo5h/8U2Db7n/Ndrm
 G2ZsOSEUMs79Cs5uzu0=; b=ZG6XlRve7QWzDRwvZRk40ibakpaPla2Tq9keXomE
 hVETZk2RE2Nl7pXWDKz1+4ZwjmenUDh0h6EtOA6JfYP/lR84itPZwh9NeFycO+Eh
 Fp4vwiK+PZjNlguvBxrr4CFHXHBvDfg45enp2RG/qI2sUIfHfX9T9e0KuXao3D1U
 lPu9SrnsZXkjoTcZtX5OB/GbF0Axa6cAiOdJddtS9EGFvf20k7l3bjhVdPJFknCV
 mERaatKCy8x35whZu4M1BGP7wD8m0ZSZETNFIeMGvtZRey/5D7TnTLgiYOjeIyZI
 ZMJ1+TkZNLVf6FXKNZXcmYGrLCwdNaVBUV/80Mm0JOczIg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w7tcxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 11:52:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-87c1558a74aso175332566d6.2
 for <freedreno@lists.freedesktop.org>; Sun, 19 Oct 2025 04:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760874775; x=1761479575;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TN7+hMpDo5h/8U2Db7n/NdrmG2ZsOSEUMs79Cs5uzu0=;
 b=SHwuksI2DFT0EvgLPJnIrt9IVxo1jZm4hQgL6lQULhlcLCmMb2l0UTlSvPgUIy9P3Q
 CarNfeco4ZuCrAAksrMF45ZYneE+qhj1ow4z5apGy7mRkoBfhdm9bK+XPCPgOkmto1yk
 4pQROhrxzSHtFi8zGv2GBl6kqmwEr65PqzG8yH/rKXeE+Mstkrz00CbFiPsim5F2Mloz
 FrfZW4uXH9dt8x36P4u/5O4Kkraxl6roS4BBQs2KMwmXcvGVcaqFqqGXKXhMUPnghzG/
 MKmyIrM9vAm4nZx0GZ0A/jh4cY4jw6V44MA4G2mOb8dVAJNeXH01WQos9YD7E0xaJKGO
 bvsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXRbJyT0WgLMBOwUkoqfTOuSaHVywr1DTnBvdSKMmDcCBk9PCW11N/7ACCgeUFBFfdSW+iXEqzEjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmJaB3Tl50TDWkCc/NteuawsXCw6EWF1eHWvTRTXxhJPUqSCkW
 DiqaMmIjgSXyxqMw93EG7yOhHxY2aL7YCyrEMBxasJiIfmu/rB7zmeSHUhi2ji2CiHsJ0tluBvb
 t6ZklJLl7ONrrKutpdQlYuQlb9tggzkjDt+N4O3JbXetY6QlhGdJDXqhZxDAtGmiL/WpXFzc=
X-Gm-Gg: ASbGncsdfdrDDtMqgoUJ/ROTOA4G0Wzt3XAswyeD6m12CRZzsLtnJbW8/eB2Yt4JkIx
 aLArf6kGOF+OUVqAvEs5yaQW85ynxg69BmywHBK6A9EWzSuhGfXjXPFbwdjaxCq6UXNS8qEh18p
 Gv/gvY8KXQWEocpk5Mlr68rjJFA6gL81IRoXsPqYkd+/EL0MTxYzUHXWZbyRUvyrdG/eZ2gvHoU
 +atpI8CXvHsSxQKIi1CNxVzRc3YLFLCAKZAoCmKPg/57tJ+qizpPzH4FiDwrajM+lBTJufXZByB
 a7r5Kefh6fBSXEBtjgoY7uameAedCxburgAC6o0yrjo4kpxwxTSHziAHKf5gEm5EKSm13GqRDjD
 BKLgFijSQQhJVRIZJUXbtmZ3TOgGvMlMbxE5MGePavKfYgqbBTiARJDcG2TN/fi2c7XJLe+Pltr
 yM4pXLMJAkZIg=
X-Received: by 2002:a05:622a:1812:b0:4e8:9402:a809 with SMTP id
 d75a77b69052e-4e89d263d69mr120018961cf.31.1760874775009; 
 Sun, 19 Oct 2025 04:52:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPcnFN62n4rxi/er56tz0GO9JJVb5HUURvhr8kT25MVhi+bHd5RuXDHCFN4GVJs/pYXza+tQ==
X-Received: by 2002:a05:622a:1812:b0:4e8:9402:a809 with SMTP id
 d75a77b69052e-4e89d263d69mr120018661cf.31.1760874774327; 
 Sun, 19 Oct 2025 04:52:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591def28beasm1501207e87.114.2025.10.19.04.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 04:52:53 -0700 (PDT)
Date: Sun, 19 Oct 2025 14:52:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_riteshk@quicnic.com,
 quic_amitsi@quicnic.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: lemans-ride: Enable dispcc1
Message-ID: <mxim7iweydzzhetqlao54hrd4ntufdhwdsbaunblyhlovdv25z@gct5iydvzbzu>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-4-quic_mkuntuma@quicinc.com>
 <v4b35cmwbkoosdgs3d6ftml4yvdkyh27q65ssqojplb7uyniwp@wuxbeof7cikr>
 <869d1f94-9d66-4045-abdb-6e88d504a884@oss.qualcomm.com>
 <62nvkgq4f5hoew4lbvszizplkm67t67dbpskej3ha6m55jnblx@vajuvual7lng>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62nvkgq4f5hoew4lbvszizplkm67t67dbpskej3ha6m55jnblx@vajuvual7lng>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX2i4OISAgMPMr
 2cG+WMXxyz3ACBIWb7QkEiAvHpS4Q5int/8pB28gty7fZSEVRN7EFXqKhA1ES/FcarJt9jZLzWH
 Ijbt2JvUxaITH8oaZ3Cov+YrSDV6uTaMpHaRntqDsPYYBGDKB7hW1A01BxkMihB5gePUj/MmQga
 Up4SYv/1akHmP5J/utO9h9SHx+6aYSzOjzXa8+nD/5V/e5onOzn6QNo5tIRjv7yhcsR8HWKVQdK
 JI65ABRurmDulaJKswF7Xcck5V3SbRrhbwgtJfrMf5AcCtW1Mvp+QALdaDwpIOGk2hVwxpyZYCh
 lHNH03qzQeDsT3noIiqeYn1SZ6YXH/HCg8WPaH0l9XGT6CEVjIPf4Kr0gv6JcJUC2+Mbn/IB9un
 rfSLujdmcKZ2/wmayjHHZ547OPWmqA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f4d117 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=vRBcCzbY8zNoOr-dCfEA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wcBwOyKKB70P6oqhiYZm474Me_vNrsP2
X-Proofpoint-ORIG-GUID: wcBwOyKKB70P6oqhiYZm474Me_vNrsP2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015
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

On Fri, Oct 17, 2025 at 03:54:09PM -0700, Bjorn Andersson wrote:
> On Wed, Oct 01, 2025 at 11:43:44AM +0200, Konrad Dybcio wrote:
> > On 9/26/25 3:53 PM, Dmitry Baryshkov wrote:
> > > On Fri, Sep 26, 2025 at 02:29:55PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> > >> This change enables display1 clock controller.
> > >>
> > >> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > >> ---
> > >>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
> > >>  1 file changed, 4 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> > >> index c69aa2f41ce2..d4436bc473ba 100644
> > >> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> > >> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> > >> @@ -436,6 +436,10 @@ vreg_l8e: ldo8 {
> > >>  	};
> > >>  };
> > >>  
> > >> +&dispcc1 {
> > >> +	status = "okay";
> > > 
> > > I think this one should be enabled by default. Unless Konrad or Bjorn
> > > disagrees, please fix lemans.dtsi.
> > 
> > Of course there is no reason for clock controllers to be disabled
> > 
> 
> On SC8280XP we have the same setup (two MDSS), there the clock
> controller was left disabled because not all SKUs had that IP-block
> accessible.

Do you mean some auto platforms or something else?

> 
> Whether this is the case of not for Lemans I don't know, if it is then
> the commit message should have stated that.
> 
> Regards,
> Bjorn
> 
> > Konrad

-- 
With best wishes
Dmitry
