Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD84ABD863A
	for <lists+freedreno@lfdr.de>; Tue, 14 Oct 2025 11:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7A810E1A9;
	Tue, 14 Oct 2025 09:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vju3B45/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EFF10E1A9
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 09:19:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87Luv016458
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 09:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/M4+9qjbR0xmZ9AUGWwlamLg
 Bh7AibV8Qv6wfylCGO0=; b=Vju3B45/mSf52hBqT0GENjluUCDiOtbOR2hShHAR
 BcJk1V4XprO6TdfMxVoQMolPrcpWikbRccTF2XTe/aPr9dkq10/7H6n3b1n8X4NF
 fFkCyHEKD1v3gwT9UVs0LNGGqc/uySAoxA71KPKW80lOwiEJT6ydGQv4aOLGbbgA
 ideY2iQsyPOj9sDoQt4yZvoLWbLAEIl+or1dOB/8T2NVGhoNfeQLSDpOlEEQYhHs
 rcatz2WUT+eM9xAbkiJzlJNwXlwekkWTNvuCCoRwFLAaIFdIBCuPr5ntVPQ8Xb5a
 PCSfkuykNjcai38qTdQkegbwlpPr10Mj5xeSIHzRYWAkCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8yy3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 09:19:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-86835654255so4723277185a.3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 02:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760433555; x=1761038355;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/M4+9qjbR0xmZ9AUGWwlamLgBh7AibV8Qv6wfylCGO0=;
 b=vxKWV7CaMq5TgsE34fnlQqcK6v6wDTYvuk8VmSJ9H19j8ZSXtVLG/4YuIyag13bin0
 v6TgA7s9+kYuD20Z5d0FTsZjLCo2l5JIcZSsf55cEmsecogXcJBLxHrrf7AekbI4aQj4
 dvNFRw+n7Wz7a38Q8M/CtEuWDh/s9Ox/SNHzkjR+sS6rNjNUopR0A/kKwEFDryog6fG3
 7CdbRveZCXMXndEZEBjrxHbtmvuD44wjPfpzE6ZoXDkjirOEVETg1ldx1nrUI+RcpevB
 yWYpIGhpmiY55GgzHgxSGx622BUSxEGhas/ge+FOyryqx52iACRNpJppHrzSf1NoGMOT
 Ryzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0jO6ys9MWo/akwSaojXAVdBRFYpC8RUCGPrjDWGsa9F3gp6oTc5KvjyRZa8J4Em0TnCmilRnG9bk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjAs1A+7WVQLNprze5FCKfvLvBCvsxGMcI7ZXhlsd/pcAi+d6I
 td3fpPOlp5AWJKra7tEeyNjDpPehaixPbJmiQODGyMAytpB3ll9inEEZ4AhwIdRJjytSfupz6ss
 WVROTE9TUzIts6v73tbYBFWoUxgUkkiawiFRFufivbmf1LLut6tbMuWndx6nxdi1tV7WsG78sRe
 qtxlY=
X-Gm-Gg: ASbGncvZmZTdPJASXQR5BJ62fXi6YKkdsPfgyUvrOaUpNtfGut6ydNAiJRMyOnaHeds
 Pr5MuuwW+SaJq4cQo/8PT+84edhmUXRTMKRD3gHDUiI95RMXqoTtiIfT54sEjoWN+en9z81m+kz
 tX/joN2aD0mDKKuI5NbDtoIswWAaYPbsPybjrOGjSkYnhijlK5YBcLWCfTDrDI+h498gxAbCNAt
 WgngW+tMNfrtp3iB+ynwI7DIAYOzrhhhktlLqPi0mczLb/HJa7iditovnvSzwJECdfjH3yW0vnx
 e0A8HY7bOXI+n5FDMJAsk8zzzRwxjwZ+k/7GxjZsShek0Xd0PCjrp+7MuupwFy7F5O+adzx0Bab
 hyFos9+s+91j9woiylXC2jOgu0/H4EjHwr1+R6zfbrONXUCkqclwL
X-Received: by 2002:a05:620a:2a0b:b0:86f:b068:32c2 with SMTP id
 af79cd13be357-88352ba768amr3441609485a.65.1760433555010; 
 Tue, 14 Oct 2025 02:19:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ0Bdv9ZRjNQZJ2bun3sNcAh/K42pzla7s+n3DhqMnWjW0vg5zZPO+f31pSNhVt7Buy9t+Hg==
X-Received: by 2002:a05:620a:2a0b:b0:86f:b068:32c2 with SMTP id
 af79cd13be357-88352ba768amr3441607285a.65.1760433554567; 
 Tue, 14 Oct 2025 02:19:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762ea11d19sm39716781fa.37.2025.10.14.02.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 02:19:13 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:19:12 +0300
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
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
Message-ID: <v6cvbds3fsbf7ebfi33mpkrgbrrb4oxubgpshzjn4o75j2jzcn@nnaenoukfu2n>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-7-quic_amakhija@quicinc.com>
 <fsqytqhe72bgmloyzm6khoprq6bysf52ufz6oi6epos7uadyho@wg4rxs6f2xyl>
 <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <374098ea-23f1-4d1a-8f70-313a7e384f8d@quicinc.com>
X-Proofpoint-ORIG-GUID: kpQJQd2X7BLkznIMjpviz020_JqdLCNT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+ljHBYbXc6wL
 ll15vnCoLRDaFKP8yOZ0X3KIWj9GtKtynxY7qSOTopZU0+9uSmPOOpOdRShUs5SNkLVphkTJoe3
 SOuQyXI3RueOJSRGBIZKlD3BziBoqe0/y+kCloE+B+ohVAV7+utOAh0UdwFBjtIUuFMDi3lc/s2
 UL9NlhnXedsKEeBokuHoX3cuI4fqV6rwVQ0F2VbmzDazTl+3SKnyyrZp7+oroZZIW01k1+OfCTR
 vHSYNRFlZGcs0m0zwpAdmrdsRuSTQJRcx6ECFU9bUMPcgQFvOvve01xUCWPVfWSWwZGzYyyHeab
 cRD86uciScvXHQeQ+WZ65ltW7dKwVBootkF5l3tAtzw/mUVuCkTf0M65/BZmFwVVOkEiZqRmFBF
 Joq8mHXDVKqr8r8izOHt7sb0jCCpsQ==
X-Proofpoint-GUID: kpQJQd2X7BLkznIMjpviz020_JqdLCNT
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ee1594 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KBoXMGrBdGQ6yHO1rqoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Tue, Oct 14, 2025 at 11:54:31AM +0530, Ayushi Makhija wrote:
> On 10/6/2025 3:44 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 06, 2025 at 07:09:23AM +0530, Ayushi Makhija wrote:
> >> Add device tree nodes for the DSI0 controller with their corresponding
> >> PHY found on Qualcomm QCS8300 SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 98 ++++++++++++++++++++++++++-
> >>  1 file changed, 97 insertions(+), 1 deletion(-)
> >>
> >> +
> >> +				mdss_dsi_opp_table: opp-table {
> >> +					compatible = "operating-points-v2";
> >> +
> >> +					opp-358000000 {
> >> +						opp-hz = /bits/ 64 <358000000>;
> >> +						required-opps = <&rpmhpd_opp_svs_l1>;
> >> +					};
> > 
> > Does it really support only a single freq?
> > 
> 
> Hi Dmitry, yes it support only single opp frequency, I got this information from ipcat sw for monaco, similar
> we have used for LeMans.
> 

Thanks for the confirmation.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
