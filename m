Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D691B0AEDD
	for <lists+freedreno@lfdr.de>; Sat, 19 Jul 2025 10:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB8010E021;
	Sat, 19 Jul 2025 08:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aumUsjPS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551CF10E021
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 08:43:04 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J6D33I023396
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 08:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+hnvC71NGCDaTEDlHwH2F+79
 X5DpGLt8T8Ke/VwrdV4=; b=aumUsjPSYsYh7JHM04fduprz9eo9a/rcbnLWUMAh
 UABO04GkBiQfvJwEk9tjuTfhFZBc3o+qt6/SrO7+Crsmah+B3r3vX4bYgphCLqBk
 BZqBZIUwuYCszGWq1l8UOhAMi2SPyyXji2okom/U2ZjBZbv85jliWQeF//r0xKp9
 /ZAMRMOWIb5j93TskW5eV0LYVaPbqxzrxore/6zgzPnYWzOch6HSVYJa3/se11bf
 dbqBLYVw9pZB4LycMoAhJDCY7q7HGIgd8i8MYh35Hg2cujtPCn9ImbzSLfdF1wNd
 mw3xOtFMFCb41izcypdp44OrmSYXiTraqLmkCruYNccDFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9r9qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 08:43:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c7c30d8986so817584385a.2
 for <freedreno@lists.freedesktop.org>; Sat, 19 Jul 2025 01:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752914582; x=1753519382;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+hnvC71NGCDaTEDlHwH2F+79X5DpGLt8T8Ke/VwrdV4=;
 b=Pmoz3KtuQRzumuFl+o0zT5zREUT8I5dpAsDmgI2JPt70qFs2EEpkeHm9rqNuEhGyCr
 4pH8xEwyTYoOhI4eaZR9PNq4UAZiiWQ01hgGI0cF7nclRmzQmbHsLAdEn3LjpXrnMzuP
 sHvPsJJMkv+KVHwMS5eHm36Cm60kufSHwk0fmLq6fdAn7kS0np5xsK6pct9nNf/EQIjW
 U+RH9DsG2IwyP+NBYXBPKhaNAFdMdYrA23DaI+xl0C06c4cD6KCj2RtnnWsbtBEmNS+o
 oKtF/SUyy94SA+kZMMrpRl+iJ8/zTFfrXaQRqA0I15yS68RV1gx7Y32rKThmYhObI/6y
 khyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzHoMc4KjQI8r+NAx1chXU2PgtgixqvRJ4gu2ILJ3rY7cFtD4wuKBIvvj7NBdMTl9QFRALR0mZ/+w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1jwPNSzQE1jFqctDGvVN6hv7ahvWizdi8dUZ/e4AJJ+F43eDV
 Qr1syWAPTAVudcizDEN1Wer3mQL2W8MURoH+D+Lndsmz1+yAP3ZU0uHRyEq9C0ZDLWPXOwtj8vx
 +Ua051KOPv/mhYguXyLoEfa07vj20oHYHesD0Kb03VI4OSeJDhEnwKsx/8FfqBdlVDrdf7kk=
X-Gm-Gg: ASbGnct9B3P2CXzQzo2IxRYdnVxhx0ybE9waCfBDcV7pZ2wwZABifwAO1C+npGaZTc9
 gmhUXvHqL9Xs8d/IA+KoVqOTqpgTRFFkLM+/I29JdDIJi0Si5ravMz4E52vaGDYIX5qJlVulu6I
 vbeIwljmoN1zzQoAQSKInOxRJclA7xHlzRjjiy900h8gnDyabDxUTbpm0bSqQt4uBsyscfTsOTQ
 6KofAxgyrUSWnZS1E9mn7taOKjb6TcSkSwSpn9VKJ4IU24jnHJGSb9vYjwanU68RPp5m09vW7rC
 s61qDb9gKrMy3kMtPLiKgHr2KKk+YI+lfgxgvvdKXTudlagKFjqdqabby9Tk3HXvcvR+zwrRvux
 3Jrf2JoHYb0ZPzjByFv538rlt/B1VHp68HMzJ8HyqkW0lnzW1YYkY
X-Received: by 2002:a05:620a:1909:b0:7d4:38f:a7b3 with SMTP id
 af79cd13be357-7e356ae1a00mr764033185a.29.1752914582257; 
 Sat, 19 Jul 2025 01:43:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaL23hIhZB17M6H1XzM5tH6etKFp/euLYf8xiH9hxUCYpIqAx2BG9Fx6g8LCbtyU3x+HRyKw==
X-Received: by 2002:a05:620a:1909:b0:7d4:38f:a7b3 with SMTP id
 af79cd13be357-7e356ae1a00mr764029885a.29.1752914581761; 
 Sat, 19 Jul 2025 01:43:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d911c9sm623429e87.147.2025.07.19.01.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 01:43:00 -0700 (PDT)
Date: Sat, 19 Jul 2025 11:42:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>, cros-qcom-dts-watchers@chromium.org,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: Fixup x1e80100 to add DP MST support
Message-ID: <fmehneccbfrtvr332o3z5qo4wduha4i32c3lf5vixcbskeioll@7ax7pupvdcnt>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-1-72ce08285703@oss.qualcomm.com>
 <unwinuwoft6sfczcjlqq5kijss3ttggfbobs6ydw5c2lkmndc6@7c23jntiprob>
 <1b385a59-5461-4c28-855e-d2379c2a8173@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b385a59-5461-4c28-855e-d2379c2a8173@oss.qualcomm.com>
X-Proofpoint-GUID: SzWAUeMibb-0Y8qfsdejrNMiR2USDgfx
X-Proofpoint-ORIG-GUID: SzWAUeMibb-0Y8qfsdejrNMiR2USDgfx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA4NiBTYWx0ZWRfX6+FC7Vax0FkV
 sN+v95+DRhum1fBhuAwB8X1vOEFjj2LxcV97Xy7JVOrnjbAUP+CQSrOMrrE5EApsr5V6KG1SlDo
 bsuEovjwhYFjown64qV5KQw2+Nk+020nqrfwaDhgC9LrWZox3r4Hk0o5KJghlBeFg2MHv8Hu+p4
 24stYkvOcEDAu/OiQnHooF7gO8Rp6pmSvFiVnSE6JAADZbMJ7cmBqSOepiyOYE4Rv0ILWG4o/Gr
 QmxmQnunwermfZj3tzeoNMce3OlTdT3kk+IomfESemlcYI+jxRpY4ePLlXBvrgK9ea3naAwPf3G
 HeJoBLIF3jWeAS8xKsNkqjayIq3mGR/aPVVT2+6P6HQFR+TFjEgulSibQOvnIQk4bS2LuhDbqPD
 9LYHYkGGth8g4mIEO1SDhlU/w9DXNBiKde6gfAAR+ysQd0rAYCxWx6UCafoPnBtyKP2rh8X9
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687b5a97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cjBuAn5bJLGjDEKm4m4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190086
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

On Fri, Jul 18, 2025 at 05:16:56PM -0700, Jessica Zhang wrote:
> 
> 
> On 7/18/2025 2:13 AM, Dmitry Baryshkov wrote:
> > On Thu, Jul 17, 2025 at 04:28:43PM -0700, Jessica Zhang wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > 
> > Please fix the patch subject.
> 
> Hi Dmitry,
> 
> Ack.
> 
> > 
> > > 
> > > Add x1e80100 to the dp-controller bindings, fix the
> > > displayport-controller reg bindings, and drop
> > > assigned-clock-parents/assigned-clocks
> > 
> > Why?
> 
> IIRC issues with the x1e80100 dp-controller bindings (i.e. the reg bindings)
> weren't being picked up by dtschema because the x1e80100-dp compatible
> string wasn't in dp-controller.yaml.
> 
> I can add this to the commit msg after moving the
> assigned-clocks/clock-parents change to patch 3.

Just explain, _why_ you are performing the change, not what is being
done (this can be understood from the patch itself).

> 
> > 
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>
> > > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > > ---
> > >   .../devicetree/bindings/display/msm/dp-controller.yaml    |  2 ++
> > >   .../bindings/display/msm/qcom,x1e80100-mdss.yaml          | 15 +++++----------
> > 
> > Split into two commits.
> 
> Would it be better if I kept the compatible/reg bindings fix in this commit
> then squashed the assigned-clocks/clock-parents change with patch 3?

That depends. If these chunks are required to fix warnings / errors
after adding compat string, then keep them in this patch. If not, split
them to other patches.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> > >   2 files changed, 7 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > index 9923b065323b..4676aa8db2f4 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > @@ -29,6 +29,8 @@ properties:
> > >             - qcom,sdm845-dp
> > >             - qcom,sm8350-dp
> > >             - qcom,sm8650-dp
> > > +          - qcom,x1e80100-dp
> > > +
> > >         - items:
> > >             - enum:
> > >                 - qcom,sar2130p-dp
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> > > index 3b01a0e47333..0e699de684c8 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
> > > @@ -170,11 +170,11 @@ examples:
> > >           displayport-controller@ae90000 {
> > >               compatible = "qcom,x1e80100-dp";
> > > -            reg = <0 0xae90000 0 0x200>,
> > > -                  <0 0xae90200 0 0x200>,
> > > -                  <0 0xae90400 0 0x600>,
> > > -                  <0 0xae91000 0 0x400>,
> > > -                  <0 0xae91400 0 0x400>;
> > > +            reg = <0xae90000 0x200>,
> > > +                  <0xae90200 0x200>,
> > > +                  <0xae90400 0x600>,
> > > +                  <0xae91000 0x400>,
> > > +                  <0xae91400 0x400>;
> > >               interrupt-parent = <&mdss>;
> > >               interrupts = <12>;
> > > @@ -189,11 +189,6 @@ examples:
> > >                       "ctrl_link_iface",
> > >                       "stream_pixel";
> > > -            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> > > -                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
> > > -            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> > > -                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> > > -
> > >               operating-points-v2 = <&mdss_dp0_opp_table>;
> > >               power-domains = <&rpmhpd RPMHPD_MMCX>;
> > > 
> > > -- 
> > > 2.50.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
