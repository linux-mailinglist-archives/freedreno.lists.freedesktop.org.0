Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C389DC046F8
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 08:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ABC10E15D;
	Fri, 24 Oct 2025 06:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6Z4oR+8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E05210E15D
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 06:01:04 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FMt0022347
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 06:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JljS+79BkkayuCyE/UdcZ4I9
 cPPqvjjS+0ZvczbI6Tc=; b=m6Z4oR+8QNq+CUaHPQE2B6M926yCzAT5l3NMhh70
 I6QLqJBv0LJUmpq5DPaWWOAp+TPo1W7yId5+/aINIMEw+fsRA/7JomF0Oq8r0q0N
 AbmUghygkhsrndWQsXX0YgD7BcmhS0oUqQEH9MfDJJQWDOkByngWC3HKPOyawZI5
 laIKe4Tdrlzx7SBfVDPDRcCipDN0Wl+3UPlx1hccFiHTElD2oaFovo+HrnLkJZS6
 vrWGyvAxnNtXo7PyM7w9UELHxo72D3NnI/IhVBvHUrT9SiArdRC9QCwTSqpCq1s5
 8fQ90Z8B2T/OWnI5STfi3lwFNU7FJ4xOtyDqxlBvRUVm1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qmx07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 06:01:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-871614ad3efso404310885a.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 23:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761285662; x=1761890462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JljS+79BkkayuCyE/UdcZ4I9cPPqvjjS+0ZvczbI6Tc=;
 b=ly8gloSlHxEM2iCyXAIFnJToF2se4xdBQpDEIpf7YDje0knx51NECrWNSih9P+r/O2
 bGj4GFYoMgRfajc8T+jxJqLCm6ratM1RK2XcMOMDgdj1e0U3ojppfziQ7CwxPCfZy24l
 mtQTi6YURS3jlW2+2F3ngnr69FolI4VK/aSnzV+2K4eTy34sZzHPd4ysdlHmv9kIuq2G
 +p1ncIYSXFgY4r0EmuT34DI2opP8QNuiKUOcXyj1RlkZfjfV4CDHq8Lr45psbcuTzaUp
 TZtoC88jKEfZXp55Huw7NX8Ps9yJEhGGBV8sCkDKnbZymP5OOayfufy3x7vV9XJXTM9r
 w2mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhyKBPfpzko+5OkTDmZE0xIrnCifK0IFAkMsurdo2AmsIja1v2vbQFBEO1oVXzmruVa8DISPNiaYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKw16kU+WehXf2q37t1gbvhij0iSY244cUTSF9lstEyKZFOg2y
 G3kpLAroXD1d7463o7XYwopvjsk2aszpu0nZJ87ggDC8ci+0evyWEaej2vgrqxpzZVg4IkuPRMf
 pc/CblDHOGRAa2r6o+CqvCJqNpt9CrbouGSjf+cm9INu0b8ujwiBy7P3SWaiksIGiSLnsXD4=
X-Gm-Gg: ASbGncsLSiWeru8UAguQAfxszJe4w7msbvhApYuQ+NGIcgYnY1YcSvIW0fhaA2HC8I/
 Wex0qR4BsWB+SZeJIsNgAZNaBb6HWw4j9b5jKGlNoHM667ocspff/QcrXI+4k49x3CrGw8rQ90k
 LpEtE5VN6A3ving6LChFLZnXZiTivdkL2nRD7BZqRgWbh7iOdwziuP1cvRGgKc7aQC204GouGoW
 eHUMqMrn62A/xRLcU8DEA95BkqFebAqjQ3YbnkYqox/mHyUpYpHBu9McK5StY8hVUEg+BYhan4D
 e7WBB+g6NldBX0VqGPuajZJh6+ni1DvunDMsiNjWuGorYhpefiRuokR7B3mPdgtkA8dhj8vRVkU
 GGLFoXFCIoRvzvm+3v5h7MXi0/PViynKeMWY3hcelPzFys1uhYUrxsH0Q4UBb
X-Received: by 2002:a05:620a:45a3:b0:891:f880:dec6 with SMTP id
 af79cd13be357-89c0fece440mr693963085a.33.1761285662241; 
 Thu, 23 Oct 2025 23:01:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHduJaSPRzsh9CpSDx/crrVPNRb7TaSEXxg5lKfzwZ0BKGlQdnu0kRcGVeK/eZaccdwzHwgHQ==
X-Received: by 2002:a05:620a:45a3:b0:891:f880:dec6 with SMTP id
 af79cd13be357-89c0fece440mr693957485a.33.1761285661726; 
 Thu, 23 Oct 2025 23:01:01 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89c11698b74sm319154485a.30.2025.10.23.23.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 23:01:01 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:00:50 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
Message-ID: <aPsWEhM7i+gDjXE0@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
 <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zxofh6bwee3vjjlntlfqy7yg2iu2mipjvl7s5bcm6gbh233cjq@nuicjojawd2d>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX6bdt1NBGej/2
 4Sb4DzNoti+sQ/yNRfRMtIXR/kcogR0zJHHgXl85HoOLA8E1+etVxbQi5SQauYYEhQuZelYRWQq
 2vcXJ74a/2+YnLEnwEaJJ+urHdGA9b85AMCM+e5jisXW3/hjjJu3OuCAu8/vWziqqKaLbKMzc1z
 pqwm3efdcqxxnLx28rKpdSDiPVeBCRXEBij9pkdDIGfnW9ob8LfiI+RWgNbO7JMWe2pihtb4jx9
 z03gDuZuGtBTIn54Ytp26WLho/eTvTS+5kTo/9jSV1ud2XJWO+/1gR58XuFjRYfa5E8OkpP8H+y
 BRkQCBfyOM9Rv8/UR7Ap87Z2GezeLeWeHUv+TThGUU96fysL7xLgHFz6G3nEs2A6WEkcHJWh7ZE
 0AXt0CJOSLp1oVRODRzfh9KSbu+MQA==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fb161f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-aLJWpWAS0NDeqwcDiMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: bePjx0tCm-4dPd8eBcR-wV0HnAelpi37
X-Proofpoint-ORIG-GUID: bePjx0tCm-4dPd8eBcR-wV0HnAelpi37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
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

On Thu, Oct 23, 2025 at 03:14:38PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 04:06:04PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> > VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/panel/panel-novatek-nt37801.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt37801.c b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > index d6a37d7e0cc6..7eda16e0c1f9 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt37801.c
> > @@ -267,6 +267,11 @@ static int novatek_nt37801_probe(struct mipi_dsi_device *dsi)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	ret = regulator_set_voltage(ctx->supplies[0].consumer,
> > +				    1650000, 1950000);
> 
> This should be done in the DT. Limit the voltage per the user.
Two reason:
1.
I see https://patchwork.freedesktop.org/patch/354612/

panel panel-novatek-nt35510.c also use regulator_set_voltage set right voltage,
so I do the same work.

2.     Kaanapali vddio regulator:

		vreg_l12b_1p8: ldo12 {
			regulator-name = "vreg_l12b_1p8";
			regulator-min-microvolt = <1200000>;
			regulator-max-microvolt = <1800000>;

	Voltage is from 1.2~.1.8 V , So I can not set it 1.65~1.95 V from DT(1.95V is beyond the allowed range).
	So I use regulator_set_voltage to set voltage, and regulator_set_voltage will choose the appropriate voltage.


Thanks,
Yuanjie

> > +	if (ret < 0)
> > +		return ret;
> > +
> >  	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> >  	if (IS_ERR(ctx->reset_gpio))
> >  		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
