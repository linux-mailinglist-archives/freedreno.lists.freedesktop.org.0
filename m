Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D2B39DE3
	for <lists+freedreno@lfdr.de>; Thu, 28 Aug 2025 14:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F21210E996;
	Thu, 28 Aug 2025 12:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwX/wFBm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805B510E996
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 12:57:08 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S94CCu007201
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 12:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EgqQAQ4KchFaH1d0/JwOmtXxNXtrGHk+dx87xXF6dec=; b=hwX/wFBmNgyWLANg
 J+UgdxKE1/wlSCUDIo4H0+8ZmZNELyjSV7p1f6DOGU1bXrzUfJgw+DnXNf5ZEZhf
 S60XDAi6ifGlozQX0feDR5JtA4tKVe5gtwHt0VWja4Ao8BnRUdfcfgJfbI5U/baV
 wtptJp9i+OoIQC9VEz19yFIY03jFzIR9Tp6HNWSNDn2X+76qrjDLvUxRt6UQylkI
 QN7b/gPoVEJKQ5gGUM8UkyKyYlGjOmdjpZWayC/uwjcxCBD+ZVvfrNwEtexTSTHv
 ZfRA1nRJWgCZFeVrWltuDBpx6ngdXzLuWk0Bc31jPZIzuZjAKE4mDM4+kGccs0pz
 TQfjEQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpghypv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 12:57:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109be41a1so36391851cf.2
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 05:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756385827; x=1756990627;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EgqQAQ4KchFaH1d0/JwOmtXxNXtrGHk+dx87xXF6dec=;
 b=WuKMtAkI+rk7dMY8RQp0nnebv2zk4SSH4SVvVH/3Y4tzuywn2TFyrZLonuuLUGvncw
 rrRKPpFFJojJWiWj9+6EzJqk8Og3mQgFPdknPcWat/+3c2wI4dLjMuZmthR2+2oGmzPA
 Bpc6G8r6vTHgwTH2gdNPgJ+sDgw5etNGGoGQnvD25eI7fIQ38whHsXancK3XE5LzIUfU
 RTynxezBSvIIJbcYhKjmMwocQzIy01fDR5DTCsFU9XlzfUZDYVG3iwJlrrtGB6hwXRCI
 y2g9NPLTZg/rPn4O8UVQDOkrw91ZLxyxVOfyKcsyWngWGEcukJ2KHu7wuskQLjmOyeGQ
 rm/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvpcRCtSG3phjYfb3pCf863FLt+pqTpqX8yWJrIbDd/urcpndRRBU8y1zrgYDl6o8bawXke62Y7EA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzfeCS9V6b8McT5CSK3BKB5xaa8LUN12obmVRzimIrMVeo6tYe
 X0tdf8TQZn6HQSvWkZIRBPpdOpOJpD23LG3xqefH4ptANOrNw1v8PuwuvSRGofCynBe7KHINVFr
 SelfHuQ59YQKyJTx+qys7KgGQlB+YOmhg1n5Ae80YyF/1RZwKGjbt3IMXTLEgsbr3XDRVbac=
X-Gm-Gg: ASbGncvARmCCBRGOIjTZZ3g0m4ydbdVn7yZd6XMFQ9NvbmIy3+HyzUFAdBCZRacBLaa
 QokMsDLicf804YFUMyyMVIy0Ds76EQoMfsRg6quLbsnBrI2D0MbLBq09YhxVYRuKOW2Vv/Ulj4g
 3CnR118nH3dLe3hJhKsn3kgqbYUd31DzhyoxKkFu1SLo3/wxy/dX0M5DbKHOMC2DmM9JExgFiMU
 o/8oot2H/9Q2nRJu3TdmXdOLo+X7eSdreaxokmXhc0Z7yhzXqpHPrbbDRPFP9yCuofX3nvQY2Xv
 5A4svOAzbWxMuSbfXhVLx8nLVM+9kcjF4Y/j4G8RX+6YZqL2+CfNZIZtT0UZfuEXc6SYrIHOGkQ
 y0mzE+w3KcVJ+GS4Zb9SXNvqidBI4KtsyYmeVq4KD1pNdQpOFEkbn
X-Received: by 2002:ac8:7fc2:0:b0:4b0:85ad:7916 with SMTP id
 d75a77b69052e-4b2aab0e427mr276090651cf.53.1756385826326; 
 Thu, 28 Aug 2025 05:57:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNc/yDmuGpGZJWn4ShQMOMzt9j5GzyojN6uEoc7LfUnq4nqYpVKDjcBVD9/JUfvz/QuIJu0w==
X-Received: by 2002:ac8:7fc2:0:b0:4b0:85ad:7916 with SMTP id
 d75a77b69052e-4b2aab0e427mr276090171cf.53.1756385825600; 
 Thu, 28 Aug 2025 05:57:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c1dccesm3228854e87.67.2025.08.28.05.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 05:57:04 -0700 (PDT)
Date: Thu, 28 Aug 2025 15:57:02 +0300
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
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 07/14] phy: qcom: qmp-usbc: Move reset and regulator
 config into PHY cfg
Message-ID: <kndlhnsihvkq64q3tgai2jrij5mzh3c5kehe6r4imj4d7fgbc3@l3edsktmx4y3>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
 <ofvzduf5xyip7w6yde2xwsrvv3tdh7ew3yyzeya2qzpqty3j7p@bnetyjowhdn5>
 <6f7c3962-ccfc-4400-a77f-399b06da93e1@oss.qualcomm.com>
 <llrt3xnd5gagovnmyzqebp2da5v67bkxjntfcgc5r5auamspyj@7v5taph3i3c4>
 <f3cc06c1-25d2-40f4-bd77-8a9c51b40efa@oss.qualcomm.com>
 <osav4kwxytfuxvnf26ugdw2qasd753smywsux5punuegbkxqgq@fp3r4esqiqyq>
 <749ec6d1-f2f9-40f5-9c41-3443698f250a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <749ec6d1-f2f9-40f5-9c41-3443698f250a@oss.qualcomm.com>
X-Proofpoint-GUID: T-OACZbjY6kGVjPvLIgKc_gHGbobxoqv
X-Proofpoint-ORIG-GUID: T-OACZbjY6kGVjPvLIgKc_gHGbobxoqv
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b05223 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mEe_ubnSu4kMW0ft-g0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX2NQSj+tcnXm9
 YBfiieSHMwqMHn0Z0OV7v5u2xmjgAtp5YpYuL5luoHFAlhX5IvNcyjDPtz5OqH2KGGR5ReoGHfj
 F+G5S0x6xAaEeVxbhJSNloaveWQ0W73jQDgZBrnPnF4upVMYqL7LCi1S37YvPAG54tG6Qr3aQCQ
 Ezm24uuLQzjNdWbOuTzYZAc4izrodHRjdgW3zI/zZ2Jdqxe8DfpwH1f1EDZA36gZM0qwKjJ28Bl
 +f+3NhGYfwfk2lp7HWIgIgEpv7CIh+IQTPEKdkrVYIliW87QCQ0X0NN7PV6QV43p+2AekHxacNj
 XGOrQKJjhhQP7Utf7wBP9lnBgT8bf7XP54D06WoSzftsHYN0fCdQHjETLT7raPrh7UEWrowduFH
 rdAkfrXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199
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

On Thu, Aug 28, 2025 at 09:40:51AM +0800, Xiangxu Yin wrote:
> 
> On 8/27/2025 10:31 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 27, 2025 at 09:28:00PM +0800, Xiangxu Yin wrote:
> >> On 8/22/2025 6:08 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Aug 22, 2025 at 04:29:28PM +0800, Xiangxu Yin wrote:
> >>>> On 8/20/2025 7:30 PM, Dmitry Baryshkov wrote:
> >>>>> On Wed, Aug 20, 2025 at 05:34:49PM +0800, Xiangxu Yin wrote:
> >>>>>> Refactor reset and regulator configuration to be managed via qmp_phy_cfg
> >>>>>> instead of hardcoded lists. This enables per-PHY customization and
> >>>>>> simplifies initialization logic for USB-only and USB/DP switchable PHYs.
> >>>>> Please split into two patches in order to simplify reviewing.
> >>>> Ok, will split reset and regulator part.
> >>>>
> >>>>
> >>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
> >>>>>>  1 file changed, 53 insertions(+), 55 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>>>> index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
> >>>>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> >>>>>> @@ -421,8 +421,9 @@ struct qmp_phy_cfg {
> >>>>>>  	int (*configure_dp_phy)(struct qmp_usbc *qmp);
> >>>>>>  	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
> >>>>>>  
> >>>>>> -	/* regulators to be requested */
> >>>>>> -	const char * const *vreg_list;
> >>>>>> +	const char * const *reset_list;
> >>>>>> +	int num_resets;
> >>>>>> +	const struct regulator_bulk_data *vreg_list;
> >>>>>>  	int num_vregs;
> >>>>>>  
> >>>>>>  	/* array of registers with different offsets */
> >>>>>> @@ -453,7 +454,6 @@ struct qmp_usbc {
> >>>>>>  	struct clk_hw dp_pixel_hw;
> >>>>>>  	struct clk_bulk_data *clks;
> >>>>>>  	int num_clks;
> >>>>>> -	int num_resets;
> >>>>>>  	struct reset_control_bulk_data *resets;
> >>>>>>  	struct regulator_bulk_data *vregs;
> >>>>>>  
> >>>>>> @@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
> >>>>>>  	"phy_phy", "phy",
> >>>>>>  };
> >>>>>>  
> >>>>>> -/* list of regulators */
> >>>>>> -static const char * const qmp_phy_vreg_l[] = {
> >>>>>> -	"vdda-phy", "vdda-pll",
> >>>>>> +static const char * const usb3dpphy_reset_l[] = {
> >>>>>> +	"phy_phy", "dp_phy",
> >>>>>> +};
> >>>>>> +
> >>>>>> +static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
> >>>>>> +	{ .supply = "vdda-phy" },
> >>>>>> +	{ .supply = "vdda-pll" },
> >>>>> Please fill in the values for all platforms. It well might be that they
> >>>>> all share the same current requirements.
> >>>> I checked previous DP projects and found all platforms configured vdda-phy with 21.8mA and vdda-pll with 36mA.
> >>> No. On SDM660 and MSM8998 DP defines 73.4 mA for 0.9V supply and
> >>> 12.560 mA for 1.8 V supply.
> >>>
> >>>> However, I didn’t find USB load configs in downstream and from SoC related power grids:
> >>> Please check the actual HW documentation for those platforms.
> >>>
> >>>> QCS615
> >>>> L12A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
> >>>> L5A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
> >>>>
> >>>> sm6150
> >>>> L11A: VDDA_USB0_SS_1P8/VDDA_USB1_SS_1P8 Ipk:20ma
> >>>> L4A: VDDA_USB0_SS_0P9/VDDA_USB1_SS_0P9 Ipk:50mA
> >>>>
> >>>> SM6115
> >>>> L12A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
> >>>> L4A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
> >>>>
> >>>> QCM2290
> >>>> L13A: VDDA_USB_SS_DP_1P8 Ipk:13.3mA
> >>>> L12A: VDDA_USB_SS_DP_CORE Ipk:66.1mA
> >>>>
> >>>> sdm660
> >>>> LDO10A: VDDA_USB_SS_1P8 Ipk:14mA
> >>>> LDO1B: VDDA_USB_SS_CORE Ipk:68.6mA
> >>>>
> >>>> msm8998
> >>>> L2A: VDDA_USB_SS_1P2 Ipk:14.2mA
> >>>> L1A: VDDA_USB_SS_CORE Ipk:68.6mA
> >>>>
> >>>> It seems the USB power requirements vary across platforms, and the
> >>>> 21800 µA load for vdda-phy exceeds the Ipk range in most cases.
> >>> Ipk being ?
> >>
> >> IPK: Instantaneous Peak Current
> >>
> >>
> >>>> I also tested removing the load settings for USB+DP PHY, and DP still works fine.
> >>> It mostly works either because we don't allow mode switching on older
> >>> platforms (yet) or because somebody else has already voted and that vote
> >>> keeps the required mode.
> >>>
> >>> As you've started looking on specifying proper current load, please
> >>> finish the work.
> >>
> >> Discussed with chip validation and power SW teams.
> >>
> >> The power grid tables are primarily used to ensure each module receives 
> >> the correct voltage, and they define the Ipk for each submodule. 
> >>
> >> While they don’t specify recommended regulator load values, the Ipk values
> >> reflect the expected power domain strength and can help estimate the voting
> >> strength needed for each supply.
> >>
> >> Since regulator load is mainly used for voting, I’ll define init_load_uA in
> >> the next patch based on each SoC’s Ipk values to better align with hardware expectations.
> > If the Ipk is defined per module, then it's fine.
> 
> 
> Yes, under each regulator, multiple submodules are powered, and each submodule defines its own Ipk value.

Ack, then it's what we were looking for!

-- 
With best wishes
Dmitry
