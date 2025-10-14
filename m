Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A18CBD8760
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 11:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB45E10E587;
	Tue, 14 Oct 2025 09:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErIKlQPZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C786510E521
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 09:36:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87w4R022525
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 09:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RBVC+5/5ABafrPQ+4V6HCdRE
 5Qnnq6FFZbvfYQ5jpT4=; b=ErIKlQPZQMOrg/qnmzemszHado82YkEIlTM5k+Ng
 SHK2L/l+BM4TdVruAnnOwh8LzH0kStRIjZ5qkSTSaiSf045I47edY9lctn284X+Q
 03oOOW1yFDf9mWP6ofnHDlBXtZb0dHMCWPqIQkyTv2QoOCe+HJTG/hTbmg2pdCGA
 hGhlxuzTlViBKodnkYMk7zdDvgUvD2bN8xtZQMN+pt0Xi47tAkukQ70Igwukc822
 m929KjMPQdhFHrA3qZL/UBaA0n1Mi4/pso3yqeQddVyXj6927t41f0jeGLMiwpgm
 r4GkKnnqbzrhepUJUqgzK+meRFin0yLc5Wr8CxcP2NC1WQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwj7ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 09:36:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-87bfeecc483so1497616d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 02:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760434594; x=1761039394;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RBVC+5/5ABafrPQ+4V6HCdRE5Qnnq6FFZbvfYQ5jpT4=;
 b=o7Dr6WBkxIhPiHjrLy/0kx67O50fAU2sI9Q7TJFpSM5ZS3oFLD+xbzSxz0eEkpqsHF
 DcfNIh3vNc1Cu+hLZlvGTjb/cBWOQzMU2TwPao+9bH+LCK3qjiiK4UqZIEMTonikJO8s
 21Shws2l8aC2iIffg3+VUrWJL6QM16mWe8IG5aARXSZ7Bz9S0eF6almWacCyKNJX/VDw
 rvKAUAn+IEwlZIp7bInOW7DxkMTutY+4f0t8jxPL6b0hdsvDYYyriaUyL2L7Vjn0uXEs
 hdu+jaE0wOOxfEXrFIoojQ26QSxhimmcLCJ+IfEa2SHQ8Ni/5jOl2YALf55tWTwriiuz
 K02A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlnDwqxcLmCC4zzlgaC93Eh+3A3hgk71B/qrTekT0TKLC4PPs4iewp/VqDVtwh2c98k2pxl1xqCqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUXo9z+Kw54bhbgN46eqbwx77ah90TUsJo0lCSd2zNEI94TjQD
 RORCqwuHVTVGNnzFzb9KOJh8/BDIUYVz3lsMtHTCEU8OVF0EYHP/9xxHa7Qgr792NqDnREdvEog
 xIC7lZfO6iFD7QiunvZTzcbUCvAbS2UW9kjH4npg0MOax508Kb/w3caAtN//YRCeTO3xp5EI=
X-Gm-Gg: ASbGncvVqCK/1RYV8HNucIz8h3aiiLWnG7KvmVf18yOM1wyhKwDn8pOD6Zsf42VTjBN
 UWg66SfmEeeP50OxPqLTKo1EiDfzSK75NU5UzY+tamN+eypaSn9ma93yVbTD6F3me+HzedbNL42
 MMMGJBp4/05OuRPkq1om35A/BG9uqP1yycudelyFYO10DSd8hdcs8wG8hFyAwk0EcCagy3ijxcT
 pVP5pNr342D45L8N9Kczz4g1uGua5p+1sMJyY7EVDSlGCyPTyIVE0aUgogpg3IuRBQKfjylPY0N
 ZoMOseJURvTSRdRAycBI7KKqmYXiELr0+r65Hi2htZ057au+If0At1lLOmn0cfOVYzpfXLavyhy
 BM7UYK07MiqdydrR2Nw36z5ol+GUYmDjScwm2OldVeBlK5U8eZuns
X-Received: by 2002:ac8:58c1:0:b0:4db:9c75:abad with SMTP id
 d75a77b69052e-4e6ead675e6mr362283401cf.74.1760434593436; 
 Tue, 14 Oct 2025 02:36:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERrjyZhC8WYF5QIYCGn45rVK5JIGxvjZP4pOiPgTYBQZVXJXtDIxnFvrzcK8U0iF1Mgp1g4g==
X-Received: by 2002:ac8:58c1:0:b0:4db:9c75:abad with SMTP id
 d75a77b69052e-4e6ead675e6mr362282921cf.74.1760434592949; 
 Tue, 14 Oct 2025 02:36:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59088584806sm5055024e87.123.2025.10.14.02.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 02:36:32 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:36:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI
 to DP bridge node
Message-ID: <acfvx2smpoco3hakkhas3w3fybu36it65lpelbuigcyg2f4thh@qjbtzgxcsrxj>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-8-quic_amakhija@quicinc.com>
 <vj3pwikzgbflzwqwkbvdfac44llinsmrhrqnvu6gx756xz4h3e@2lspa6zx5xgr>
 <3597f849-fe69-48a5-91cb-7a0bdc9f3e7d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3597f849-fe69-48a5-91cb-7a0bdc9f3e7d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX03KLhob7MgGV
 2+74btJ9B9zJCXrmj8JjTonZZtmkSWo+dWQWUHtmyViort+L38woaU7arBMIpH5x0wGEg8vGwD5
 fDD5hOx47W8cSrjHSZF9QQwCp+xUyK8fWosuMIw+/KanlKwrKaGBYq+fYI9XRQSPk4Tr57Fp3uO
 t9htAk9E2OdSbK6MIHYLwn/YiaMkYYAH2GptnRcbjGH2oJhuLSXBtzc7z1vtP02ssu00pfvBZ0j
 RD6EtKdwAxb3s4gK+ySk5Wxkrq0uy2h7bQ4NQ6Jz7QDfMjBVwXmiHCPHQRh9itPaV6R2UAm5ckw
 /EhoGavyz0R3T4vYJHIaM/2Fr7qYFpV/qomBJmoa2zYplbldur/7eiY6il5wsYgh4+n1qRfaWDb
 93fTb2tu8NQxwYbnWModHgr5GqoKBw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ee19a3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=mWwphNQy6DiE2YH7zW4A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ks7NRKG2ym_LzSoLL2k9AIQOPAOxNV9C
X-Proofpoint-ORIG-GUID: ks7NRKG2ym_LzSoLL2k9AIQOPAOxNV9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
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

On Tue, Oct 14, 2025 at 12:06:13PM +0530, Ayushi Makhija wrote:
> On 10/6/2025 3:46 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 07:09:24AM +0530, Ayushi Makhija wrote:
> >> Add anx7625 DSI to DP bridge device node.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 170 ++++++++++++++++++++++
> >>  1 file changed, 170 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> index 891e49602c97..5d4040376857 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> @@ -24,6 +24,64 @@ chosen {
> >>  		stdout-path = "serial0:115200n8";
> >>  	};
> >>  
> >> +	vreg_12p0: vreg-12p0-regulator {
> > 
> > Why are these nodes not in a correct place? Also, why are they named
> > differently from all other regulators in this board file?
> 
> Hi Dmitry,
> 
> Will keep the nodes at their correct place based on alphabetical order in next patchset.
> Similar names I have used in LeMans for these regulators. We have kept these name based on the information of these regulator we got from SW doc for monaco.

There is a slight difference between two DTSIs. LeMans RIDE uses
vreg-foo-regulator, while qcs8300-ride.dtsi got regulator-usb2-vbus
(which is close to what other platforms use). I think we should also be
using regulator-vreg-12p0.

-- 
With best wishes
Dmitry
