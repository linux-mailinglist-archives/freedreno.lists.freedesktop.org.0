Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJy2OeMmoGk6fwQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 11:56:35 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1AE1A4B10
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 11:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E774610E8DC;
	Thu, 26 Feb 2026 10:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwomh1lb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QgkteOA7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B2310E8DC
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 10:56:32 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61QAL5X23754950
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 10:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8kE4qU+GVTOAZ+Ag1Onil2K/s8LSRBaWIjephAuyxDU=; b=fwomh1lbiPjQm1dr
 s6puFpJxIhNly1kr8wUAjBDDI17guul77yDV9LkucR71wK4nZkeT0iDsAjh1qjwT
 jzGlYt2LF5AJFA1t4X/Wo8lVgpokhBBh/0FuQtSgwHxbednhCH9XPR/DWyzJ8RfY
 Tr/QGwXwrQOxpNWLSEDw4rzpxBvR7/Yu6yppObVhwKf2va9F0xzGV/JlXnXc189W
 5uhDx/+4IBXfBCjnfKMdV2XvrkMN0kWHMTi0wyRNZvZkvxEJi5M9hpu2HClIw9Kr
 7FVhXquT/AD4+U9WM95oajexD198Ga20z1or5beGleM33LQO8YL/bWZnGoQpY/+y
 G+GeyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chyv9m06g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 10:56:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c71156fe09so458382985a.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 02:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772103391; x=1772708191;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8kE4qU+GVTOAZ+Ag1Onil2K/s8LSRBaWIjephAuyxDU=;
 b=QgkteOA7/CsCkQpa6OBSPUKgnzXAaNHLzt0/zglIDf6msaC9wi8kLN9o51kjCUC8WD
 oHDaZP8acyRFwuUVbMuMrBl6vDJsaHO1sqLMqf/Q2exVsGUgydTThefkR32w+y9VOik2
 yROOqfZh1guBrklV0wE5oIeYvorZDvb1fvfznEsHa4l6q/yyM72glWGPqptxlMx15mRQ
 jbywO7qV7bmJAMmNpSSaIsMYYUKloNMDSZWYAooAepT4E9URLVD7GYlhZ+3VpAoUMVyT
 hIRFzD1pTA6HBad7NHV3B7bjib6IekuITmmgEnW9BRxVeeGfdGxllgn8k4HNCAf0adSh
 5+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772103391; x=1772708191;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8kE4qU+GVTOAZ+Ag1Onil2K/s8LSRBaWIjephAuyxDU=;
 b=OayQrt1MKCJyjlvS+ktgeILvZEUPWLYEMuluN2S+Vcd0fIO1KYK5gfnuvmtlU7Z/kz
 XvIubtSzvgQdZ46wr8KAU4G/wicQvyVFvMRf5Ibk04Dica3IP228l88p9I0d5VDxzuBX
 pX5DSEJSOPpyxvCr+SjoziKr90cZ6rWyFk4kxnfwfA9K9ht2C5/sdr0ps8sM/g/daPqP
 cg52IODSmUYshsEGSLeBCvvf/OaKy+BDboJjz+K5VTCgCUxCoY2nbW74+bCzmgmYr3O+
 bpQXfVbHkfOnbt8pwtdLVxEIAgd2oRR8AX/cSzwjYyGkfw7BAh8SUFYXRjFpiHl2+eMO
 SrDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSqGJ7VxfERksc24vFaSzNrHR1KSsY2QNBjK2NvofQno2yVtea7uWioONcCRDSj52x+AEcAsEgMh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWTE0P8+Wnmh314cd6mHprRPXbcgAaACuNUiZHW0h4Q+HRnAze
 C1bbJHZYmCOtxIv6vAEQz61srBs4I7wgFbGW7Retp7GbmfJmJy/E8MClAdAma1WiCZ7JhqbJfXR
 nvf1PJmFJToh2k85BrUU7PhfiOo9blR2ZD+afSGoca0rnewk+KPIBYgGF+P+ZDq7yd4UZk2U=
X-Gm-Gg: ATEYQzxJ7pFXKuiDbHe+rHlVDq20BgVIZ5VePq+y6VnBfh6wdrXp8qJPiEIpFXNPFbD
 zlk32pEgtYYXT6tx8U2Nkg5p9gL5V2BzBNiREMSb2vKA9JqdqgktHxErqJheYju8oClL+ZJv+nl
 HEs404FV0KV4jnnBVroGT6gEfT2sFz94eKDwcGLFHTeApU1txQRfYVj447m3LcElOhRFIrYIaQ+
 6GHMYOjgrNGZX7Ehga+fULUjFceF+i+APBjyIV4Y6g+5lq7/qFOXG9RA1CJEoBOWA+vXmPEdl0c
 zKLJJw37vqK70kIgnRMx1N6mtfjhh36gVPWffrxYs7ZxKPspAbcep7PYLeN5vv0XZi/hjRB8kku
 AR+ntRdA7VB+9qXr/63y+5+4mMue1pAXcQTgSq9kx2BncoONHubxdz/gSowyPyHINHNDfWe2uM/
 +z2GrPhCCpQA9gd3tj/5+H4DFnzzkhYpmD5j4=
X-Received: by 2002:a05:620a:2956:b0:8c6:e224:926d with SMTP id
 af79cd13be357-8cbbcf2da6bmr478125485a.16.1772103390864; 
 Thu, 26 Feb 2026 02:56:30 -0800 (PST)
X-Received: by 2002:a05:620a:2956:b0:8c6:e224:926d with SMTP id
 af79cd13be357-8cbbcf2da6bmr478122985a.16.1772103390355; 
 Thu, 26 Feb 2026 02:56:30 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a10a0350bdsm698159e87.2.2026.02.26.02.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 02:56:29 -0800 (PST)
Date: Thu, 26 Feb 2026 12:56:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
Message-ID: <rwsaypiovv3xtw5pfxw5rksmqetv4mogu4yy7yrm7gfknezmuw@bh6v5q2zeuiy>
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-2-mitltlatltl@gmail.com>
 <20260225-analytic-economic-parrot-4c3a45@quoll>
 <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
 <CAH2e8h7T3Qy1f=-34SK+q=n9TRYOtzyxY8R6yKZJZGr_f+UMZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h7T3Qy1f=-34SK+q=n9TRYOtzyxY8R6yKZJZGr_f+UMZg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: ALe67AvajzM-KGWAeiP9hIz-u7xq8rdv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5OSBTYWx0ZWRfXwcLrxBXYv6Ru
 2sGAkkhgCAqNW83VF6BLqwOhm47egLKUtyYubi393s0jTUGchsW7hEwHmEOjXBpFFWI0OHLQtqL
 5gv/h9UJYeeOhkY9nYkVuKEVVuSyK3y6Ttywf5GDEv/Uo0edMqg7C1tiL8jthKCC5BkVVmkj9x8
 qi1wgKnfVayNisAn6MTXmgFfa74HhowpVsFXg6TMefPHsfTHNHxEGW9JBFZnSSZ8DQdwlm/MeMB
 uDicwVReWCkqL7FbhvElRDn55PyG9SjI9/FX7GaFr+zXYFNzqQvmGtBvLVUmpQt7VelG+LZSMm5
 6WTYTih+02j3mpICCBAVyWG0C44OXvTz+p04+Og+iUSY1+ejbjwgWb5fUVOhQTPNbgvB1cD1Gpe
 N8mxukf2+2Xc7ZHDG+isa1Lkj7Ui0DRb2UIh7Vo7ae/HrtHHm6gmOfqIiAtGInFI00YPgV6IMHa
 RDOTxqYUhOgMgczR/WA==
X-Authority-Analysis: v=2.4 cv=GZwaXAXL c=1 sm=1 tr=0 ts=69a026df cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=H-TpH9_BN8MYRBI9SD8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ALe67AvajzM-KGWAeiP9hIz-u7xq8rdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260099
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 4C1AE1A4B10
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 06:44:02PM +0800, Pengyu Luo wrote:
> On Wed, Feb 25, 2026 at 7:02 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 2/25/26 11:24 AM, Krzysztof Kozlowski wrote:
> > > On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
> > >> Document DSI PHY on SC8280XP Platform.
> > >>
> > >> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > >> ---
> > >>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > >> index 9a9a6c4ab..9223af1f4 100644
> > >> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > >> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > >> @@ -23,6 +23,7 @@ properties:
> > >>                - qcom,sa8775p-dsi-phy-5nm
> > >>                - qcom,sar2130p-dsi-phy-5nm
> > >>                - qcom,sc7280-dsi-phy-7nm
> > >> +              - qcom,sc8280xp-dsi-phy-5nm
> > >
> > > Your other commit claims it is compatible with sa8775p, just like some
> > > other devices here.
> >
> > If that helps, they do have the same values for the REVISION_ID registers
> >
> 
> Thanks for confirming this,I will add this to the commit message and
> fallback to sa8775 then.
> 
> I am curious, do the PHY QUIRKs in dsi_phy_7nm.c reflect PHY revision?

Yes

> I notice
>             REG_DSI_7nm_PHY_CMN_REVISION_ID0       QUIRK
> SM8250:     0x00000014                               4.1
> SM8650:     0x00000025                               5.2
> SC8280XP:   0x00000024                               4.2
> SM8750:     0x00000027                               7.0(*)
> 
> (*) SM8750 is 7.2 in the downstream.

Please change SM8750 to 7.2 (and SM8150 to 4.0 FWIW).

> 
> Best wishes,
> Pengyu

-- 
With best wishes
Dmitry
