Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABB5CB2617
	for <lists+freedreno@lfdr.de>; Wed, 10 Dec 2025 09:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2B10E695;
	Wed, 10 Dec 2025 08:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpmUXVBm";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZCV1mlE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277A610E6A8
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 08:21:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BA6DtX11598393
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 08:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HnPXid0omdHPGaut8KB5nAWM
 wKfDbeTFf33MoQUOo/U=; b=JpmUXVBm5kGIG3UUOa2wLGvW8fMO9OJGlDMfCXvc
 uEnKlIASTDsy1TgCWU2/ixfBVd3RrPmDyVhBxHTUqeOuWOo8j21AsWDW02YNz+zt
 WrKS5lnuJV97yRy/qVKGHu3IQAPidokI+0Ca4ZRf89VtNLGEG5Fy20w4eO3Ayo5h
 vUbyA/viG1rCqgZ4ssNEJjdtKwrLVSduGWqsSIP1QbNyke4bcyteTpWFg5kTFWzH
 Zm3EJBolnw2XYA3CjO7aUZvIIpxiP/lS71AxUXhKEc7pm0Da7ZaVSSvhZDmb3io5
 hMkrFuIlHkdSL1wGTaE6/tXQF3s8B+SA1C/NZ8h+6VHdJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp0kyq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 08:21:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed782d4c7dso108719131cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 10 Dec 2025 00:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765354900; x=1765959700;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HnPXid0omdHPGaut8KB5nAWMwKfDbeTFf33MoQUOo/U=;
 b=cZCV1mlE/BWB7ZGmnbfEFntyi2a/tabi0zjgeCuNpXCIkknaqiqef3lGnPU+dPmY1Y
 992euq9SlqxdR0iKPoz0gsFXl/U0EMtD8ikZg3bBGUWYn+KexSAKucdpxC/GypQmdxK8
 J1hITYXQcL5NyJRJf2CkjbkvWQ/vXGyaWz+DD8Rpz4yCrXDmW1b1JgWPpwM+/XOB0jgU
 7Ws6Ov5NcEakStLdO7DMSqdOV4yI+e7KaHwYFUqQpbe8K84fepbAfwdut5JHkMCRtCWY
 Hwjzx4uWKxleIPOA+IH+UOa4GSHamJwYcNB5UnT9fXEqrqmtyv2K2owhp78+U2AkyrM/
 oRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765354900; x=1765959700;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HnPXid0omdHPGaut8KB5nAWMwKfDbeTFf33MoQUOo/U=;
 b=mC6N9+paw3FugsvCcsapEvOanzy8MN2Y84issm5TfLuIPpvRCxzlRr3j9NWMdGg9BL
 IjBkbphd0TSwoBaszRrxFhkAzS8KmcR9C0c+v4dcfPKyXHQgUZZi8G4et4BLG+q0DAkc
 HOGC3P/SuZaruprHS4nzYfrttNCi9letMyQZTG6zQ1IupnX1IoeFJruHyKN9CyeVdKCz
 iidpYA06nTxKqjwbkxOqKV48T2Th8PQnUDlFhI4idzuqpgtiM4zz97GK5sjA3DXrECdl
 mYtU3h3B66wh2SUC+r7pIKKX4Sgv6e1NA2mbQsaOapSAu43Yg8amcAdw7YWIya0IznlE
 wHDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhSR8D4OHaeGczFUx4010dgXETSWJ13GuXsjkL1SL1ktN2sVjiVU6bNx8O2RjzkdoHHH4kyJBApPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxayobSDo8LQxhTzZVxp058uGVq7qXOQxJ9CHxsCUxw4atPgEmm
 +fsYrcaimlLQF4rmtZeK4KBqMu/ywUy4FK+3wzhpn3587bShtNijiE1RntjPoH68bfMS5KsJAiP
 etlYJ4RbukbaAAgSZLzssNFxnEEsbycaFqqP1d40NkPGq737M+pg5PqZ6+oYjRG8dCHTTkDc=
X-Gm-Gg: ASbGncvjpjuEMZ+9po02RCaG/wEMrtPf/p+zKroy4MxfjuWJEz0B0+HXTBNInwvHRex
 aYf6JYFbhm/lq+8z9pd1s1kKk4AbrlNfJTbvlKxKJIbx0iDLi3NNm+eQIknK4pa8EjoKNAbweqV
 /BPV8Hd8JObDiXRmeMOdlFKsYKvVsAe5dAZAsx47jNEBNidZunnu9q6RZ1x25/9cvIUOTgnai3W
 f9NcCM7IKoWfglkR18QkvJvtmgMGQqK9/WDlPNZM/pUhyNcrMcJKvrDNug1NcT6sJPbLfuQgXUE
 /X4jgQjfRWtA26U1QCBLSSNH4XDCW0060tpyk/yHHwjzjt13mkxZsxOG3f1Tu/ohIX3ldXyv+Lh
 /Yo6trQREND3prgmgMaEdvUVPXbPMiHpwDSF3woON+DzIYSoOf00VuLae5E36c1RdRgs66qw6zx
 hGMscnCJsGcCxg1wdCzA63lkc=
X-Received: by 2002:a05:622a:2444:b0:4ee:9b1:e2c with SMTP id
 d75a77b69052e-4f1b1a850d6mr21108761cf.33.1765354900589; 
 Wed, 10 Dec 2025 00:21:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZERnPWe3Yc2HBRs6Tkey0IEG4u7fCpGxa0fWGHQbkO3ydYsnHYceLuRvt9f6FnX3itW8Hgw==
X-Received: by 2002:a05:622a:2444:b0:4ee:9b1:e2c with SMTP id
 d75a77b69052e-4f1b1a850d6mr21108321cf.33.1765354900148; 
 Wed, 10 Dec 2025 00:21:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7c1e54csm6202863e87.59.2025.12.10.00.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Dec 2025 00:21:39 -0800 (PST)
Date: Wed, 10 Dec 2025 10:21:37 +0200
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
 quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display
 device nodes
Message-ID: <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
 <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MSBTYWx0ZWRfX72ZE/QfUstYS
 bN3oiBdgoAL82Vf5wo/NWd/45o2N5xCsZP1BLIW7p6GnvYulPZthnFzh48h0PVNnvdgxsAcUWMd
 +lkAl4cgNH82WA4G8XxkjmieQMeMDdK/53+W9BMYluWOksKeQqlZ2LJECnPxp56KM9iPn1lXMhg
 B0xszFPZOYSQ+OsjGyFAHeDh0Ct3YTKjbJ39bNNN7f4FXausa+hYRtzM8nGI76BbZ3n7TvaQgiz
 K4d/XJOHOAWUKt5fiOWtj4jj6bg1ew+yMgVtl+/JlcIA+7zXDGxwIhWm54bkFrbUNKOlfaGpf+I
 Q5JAArAghAdfBM9NB+yOXUxtCKb67N5MW52kU4ZDdhyxDdYIQCa0pg1sTSCOv055zPy+C5V40+W
 SRRYeY6yOs4Ix2yW2e5jZQVgHVHmxg==
X-Proofpoint-ORIG-GUID: YrpHCj8O13GG_9CVwBkx3_VeH-f_q-aG
X-Proofpoint-GUID: YrpHCj8O13GG_9CVwBkx3_VeH-f_q-aG
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=69392d95 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=bsoMiNti4Xze2ZiuTnAA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100071
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

On Mon, Dec 01, 2025 at 02:35:44PM +0100, Konrad Dybcio wrote:
> On 11/25/25 11:56 AM, Mani Chandana Ballary Kuntumalla wrote:
> > Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> > Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> > on the Qualcomm Lemans platform.
> > 
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> > ---
> 
> [...]
> 
> > +			mdss1_dp1: displayport-controller@2215c000 {
> > +				compatible = "qcom,sa8775p-dp";
> > +
> > +				reg = <0x0 0x2215c000 0x0 0x104>,
> > +				      <0x0 0x2215c200 0x0 0x0c0>,
> > +				      <0x0 0x2215d000 0x0 0x770>,
> > +				      <0x0 0x2215e000 0x0 0x09c>,
> > +				      <0x0 0x2215f000 0x0 0x09c>,
> > +				      <0x0 0x22160000 0x0 0x09c>,
> > +				      <0x0 0x22161000 0x0 0x09c>,
> > +				      <0x0 0x22162000 0x0 0x23c>,
> > +				      <0x0 0x22163000 0x0 0x23c>;
> 
> The last two regions still happen not to exist

According to the memory map I observe, they do exist.

> https://lore.kernel.org/all/vc2hen5r7xdaj4nepkoy7pk2jmj4y4hgog5o2nfndrff4yti2m@g46svhsdyy7m/

-- 
With best wishes
Dmitry
